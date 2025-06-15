import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khushiduaadmin/controllers/authController.dart';
import 'dart:html' as html;
import '../constants/firebaseRef.dart';
import '../models/managementModel.dart';
import '../views/dashboard.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthController _authController=Get.find<AuthController>();

  createAdmin() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: "admin@gmail.com",
        password: "123456",
      );
      ManagementModel _managementModel = ManagementModel(id: userCredential.user!.uid,
          email: userCredential.user!.email!,
          role: "Super_Admin",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(), firstName: 'Admin', lastName: 'John');
      await managementRef.doc(_managementModel.id).set(_managementModel.toMap());
    } on FirebaseAuthException catch (e) {
      print('Error creating admin: ${e.message}');
    }
  }

  Future<void> login(String email, String password) async {
    _authController.setLoading(true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      html.window.localStorage['adminId'] = userCredential.user!.uid;
      await managementRef.doc(userCredential.user!.uid).get().then((value) {
        _authController.setManagementUserModel(ManagementModel.fromMap(value.data()!));
        _authController.setLoading(false);
        Get.offAll(DashboardScreen(),transition: Transition.downToUp);
      });

    } on FirebaseAuthException catch (e) {
      print("Error logging in");
      _authController.setLoading(false);
    }
  }

  getAdminDetails() async{
    // SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? adminId=html.window.localStorage['adminId'];;

    await managementRef.doc(adminId).get().then((value) {
      _authController.setManagementUserModel(ManagementModel.fromMap(value.data()!));
    });
  }
}
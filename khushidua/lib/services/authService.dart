import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:khushidua/constants/firebaseRef.dart';
import 'package:khushidua/controllers/userController.dart';
import 'package:khushidua/models/userModel.dart';
import 'package:khushidua/widgets/customSnackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  UserController _userController = Get.find<UserController>();

  register(String email, String password, String name) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          points: await prefs.getInt("userPoints") ?? 0,
          isLoggedIn: true,
          isMember: false,
          readDuas: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isBlocked: false);
      userRef.doc(user.id).set(user.toMap());
      _userController.setLoggedIn(true);
      await prefs.setBool("isLoggedIn", true);
      await prefs.setString("userId", user.id);
      Get.back();
      CustomSnackbar.show("Success", "Signed up successfully");
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.show("Error", "Something went wrong. Try again later", isSuccess: false);
      // _authController.setLoading(false);
    }
  }

  login(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      prefs.setString("userId", userCredential.user!.uid);
      getUserData(userCredential.user!.uid);
      CustomSnackbar.show("Success", "Login successfull");
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.show("Error", "Something went wrong. Try again later", isSuccess: false);
    }
  }

  getUserData(String userId) async {
    await userRef.doc(userId).snapshots().listen((event) {
      _userController.setUserModel(UserModel.fromMap(event.data()!));
    });
  }
}

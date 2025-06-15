import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/models/managementModel.dart';
import 'package:khushiduaadmin/services/authService.dart';

class AuthController extends GetxController {
  ManagementModel _adminModel =
      ManagementModel(id: '', email: '', firstName: '', lastName: '', role: '', createdAt: DateTime.now(), updatedAt: DateTime.now());
  ManagementModel get adminModel=>_adminModel;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  createAdmin(){
    AuthService().createAdmin();
  }

  setLoading(bool value){
    _isLoading=value;
    update();
  }

   setManagementUserModel(ManagementModel managementModel) {
    _adminModel =managementModel;
    update();
   }

  getAdminDetails() async{
    await AuthService().getAdminDetails();
  }
  login(String email, String password){
    AuthService().login(email,password);
  }


}

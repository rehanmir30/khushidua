import 'package:get/get.dart';
import 'package:khushiduaadmin/controllers/authController.dart';
import 'package:khushiduaadmin/controllers/categoryController.dart';
import 'package:khushiduaadmin/controllers/duaController.dart';
import 'package:khushiduaadmin/controllers/userController.dart';

class InitController extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
    Get.put(DuaController(), permanent: true);
    Get.put(UserController(), permanent: true);
  }
}

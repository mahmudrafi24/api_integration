import 'package:get/get.dart';
import 'package:loginsignup/screen/auth/loginScreen/controller/login_controller.dart';
import 'package:loginsignup/screen/auth/signupScreen/controller/signup_controller.dart';

class AppAuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => LoginController());
  }
}

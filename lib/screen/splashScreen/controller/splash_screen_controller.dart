import 'dart:async';
import 'package:get/get.dart';
import 'package:loginsignup/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(AppRoutes.signUp);
    });
  }
}

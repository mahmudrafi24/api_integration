import 'package:get/get.dart';
import 'package:loginsignup/screen/errorScreen/controller/error_controller.dart';
import 'package:loginsignup/screen/splashScreen/controller/splash_screen_controller.dart';

class AppInitialBindings extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(()=> SplashScreenController());
    Get.lazyPut(() => ErrorScreenController());

  }
}

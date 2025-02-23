import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:loginsignup/services/connectivity_services/connectivity_services.dart';

class ErrorScreenController extends GetxController {
  RxString errorMessage = "".obs;
  RxBool isInternetProblem = true.obs; 
  final ConnectivityService connectivityService = Get.find<ConnectivityService>();

  initialDataCall() {
    try {
      if (connectivityService.connectionStatus.contains(ConnectivityResult.none)) {
        errorMessage.value = "No internet connection!";
        isInternetProblem.value = true;
      } else {
        errorMessage.value = "Error form occurs";
        isInternetProblem.value = false;
      }
    } catch (e) {
      log("error form error screen : $e");
    }
  }

  @override
  void onInit() {
    initialDataCall();
    super.onInit();
  }
}

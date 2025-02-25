import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/services/api/api_post_service.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();

  clickAndSendOtp() async {
    try {
      // Check if the form key has a valid context and validate the form
      if (forgotPasswordKey.currentState?.validate() ?? false) {
        isLoading.value = true;

        var data = await ApiPostServices().apiPostServices(
          url: AppUrl.forgotPassword,
          body: {"email": emailTextEditingController.text},
        );

        if (data != null) {
          Get.toNamed(AppRoutes.otpScreen,
              arguments: {"email": emailTextEditingController.text, "isForgot": true});
          AppSnackBar.success("OTP sent successfully");
          log("Data: $data");
        }
      }
    } catch (e) {
      log("Error from forgot password button click: $e");
      // Handle any exceptions that might occur
    } finally {
      isLoading.value = false;
    }
  }

  clickCancelButton() {
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    emailTextEditingController.dispose();
  }
}

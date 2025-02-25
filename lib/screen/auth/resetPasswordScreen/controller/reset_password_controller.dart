import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/services/api/api_post_service.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';

class ResetPasswordController extends GetxController {
  RxBool isLoaded = false.obs;
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController reEnterPasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  var artData = Get.arguments;

  clickResetPasswordButton() async {
    try {
      isLoaded.value = true;
      var data = await ApiPostServices().apiPostServices(
          url: AppUrl.resetPassword,
          body: {
            "newPassword": newPasswordTextEditingController.text,
            "confirmPassword": reEnterPasswordTextEditingController.text
          },
          token: artData);
      if (data != null) {
        Get.offAllNamed(AppRoutes.login);
        AppSnackBar.success("Password reset successful");
      }
    } catch (e) {
      log("Error in clickResetPasswordButton: $e");
    } finally {
      isLoaded.value = false;
    }
  }

  @override
  void onClose() {
    newPasswordTextEditingController.dispose();
    reEnterPasswordTextEditingController.dispose();
    super.onClose();
  }
}

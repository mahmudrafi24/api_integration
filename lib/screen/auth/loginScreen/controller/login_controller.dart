import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/services/api/api_post_service.dart';
import 'package:loginsignup/services/app_storage/app_storage.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRememberme = RxBool(false);
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  /// Create Function for login
  clickLoginButton() async {
    try {
      if (loginKey.currentState!.validate()) {
        isLoading.value = true;
        log("Email: ${emailTextEditingController.text}");
        var data = await ApiPostServices().apiPostServices(
          url: AppUrl.loginUrl,
          body: {
            "email": emailTextEditingController.text,
            "password": passwordTextEditingController.text,
          },
        );
        if (data != null) {
          Get.offAllNamed(AppRoutes.home);
          AppSnackBar.success("Login Successful");
          // Set User token data in get storage
          AppAuthStorage().setToken(data["data"]["accessToken"]);
        }
      }
    } catch (e) {
      log("Error from login button click: $e");
    } finally {
      isLoading.value = false;
    }
    @override
    void onClose() {
      emailTextEditingController.dispose();
      passwordTextEditingController.dispose();
      super.onClose();
    }
  }
}

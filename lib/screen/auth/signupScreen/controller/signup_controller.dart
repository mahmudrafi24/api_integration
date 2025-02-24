import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';

class SignupController extends GetxController {
  bool isChecked = false;
  RxBool isLoading = false.obs;
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  taponSignupButton() async {
    try {
      if (signupFormKey.currentState!.validate()) {
        isLoading.value = true;

        Map<String, dynamic> signupData = {
          "fullName": fullNameTextEditingController.text,
          "email": emailTextEditingController.text,
          "password": passwordTextEditingController.text,
          "role": "USER",
        };
        final response = await post(AppUrl.signupUrl as Uri, body: signupData);
        if (response.statusCode == 200) {
          AppSnackBar.success("Signup Successfully");
          isLoading.value = false;
          Get.toNamed(AppRoutes.otpScreen,
              arguments: {"email": emailTextEditingController.text});

          debugPrint(signupData.toString());
        }
      }
    } catch (e) {
      AppSnackBar.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void toggleCheckbox(bool? value) {
    isChecked = value ?? false;
    update();
  }
}

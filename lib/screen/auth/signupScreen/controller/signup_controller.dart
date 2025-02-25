import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
          "fullName": fullNameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "password": passwordTextEditingController.text.trim(),
          "role": "USER",
        };

        final response = await http.post(
          Uri.parse(AppUrl.signupUrl),
          body: jsonEncode(signupData),
          headers: {
            "Content-Type": "application/json",
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          AppSnackBar.success("Signup Successfully");
          isLoading.value = false;
          Get.toNamed(AppRoutes.otpScreen,
              arguments: {"email": emailTextEditingController.text});

          debugPrint("Signup Data: ${signupData.toString()}");
          debugPrint("Response Body: ${response.body}");
        } else {
          AppSnackBar.error(
              "Signup failed. Status Code: ${response.statusCode}\nResponse: ${response.body}");
        }
      }
    } catch (e) {
      AppSnackBar.error("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void toggleCheckbox(bool? value) {
    isChecked = value ?? false;
    update();
  }
}

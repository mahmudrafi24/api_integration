import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/utils/gap/app_size.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/button/app_button.dart';
import 'package:loginsignup/widget/inputs/app_inputs.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;

    return GetBuilder(
      init: LoginController(), // Initialize the controller here
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: "Login",
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(
                  height: 20.h,
                ),
                CustomText(
                  text: "Email",
                  fontFamily: 1,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                Gap(
                  height: 10.h,
                ),
                AppInputWidget(
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  fillColor: AppColors.black50,
                  filled: true,
                  maxLines: 1,
                  isEmail: true,
                ),
                Gap(
                  height: 20.h,
                ),
                CustomText(
                  text: "Password",
                  fontFamily: 1,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                Gap(
                  height: 10.h,
                ),
                AppInputWidget(
                  hintText: "Enter the password",
                  keyboardType: TextInputType.visiblePassword,
                  fillColor: AppColors.black50,
                  filled: true,
                  maxLines: 1,
                  isPassWord: true,
                ),
                Gap(
                  height: 20.h,
                ),

                // Checkbox with GetBuilder
                Row(
                  children: [
                    Checkbox(
                      value: controller.isChecked,
                      onChanged: (bool? newValue) {
                        controller.toggleCheckbox(newValue);
                      },
                      activeColor: AppColors.black600,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: "Remember me",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black600,
                      fontFamily: 2,
                      maxLines: 3,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                      child: CustomText(
                        text: "Forgot Password?",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green,
                        fontFamily: 1,
                      ),
                    )
                  ],
                ),

                Gap(
                  height: 25.h,
                ),
                CustomButton(
                  height: 40,
                  onTap: () {},
                  fillColor: controller.isChecked
                      ? AppColors.black700
                      : AppColors.gray,
                  textColor: AppColors.white100,
                  title: "Login",
                ),
                Gap(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Or",
                    ),
                  ],
                ),
                Gap(
                  height: 20.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomText(
                    text: "Don't have an account?",
                    fontFamily: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  Gap(
                    width: 3.w,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.signUp),
                    child: CustomText(
                      text: "Sign Up",
                      fontFamily: 1,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  )
                ])
              ],
            ),
          ),
        );
      },
    );
  }
}

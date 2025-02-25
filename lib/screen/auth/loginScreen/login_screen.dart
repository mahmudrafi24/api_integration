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
            child: Form(
              key: controller.loginKey,
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
                    controller: controller.emailTextEditingController,
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
                    controller: controller.passwordTextEditingController,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Theme(
                              data: ThemeData(
                                unselectedWidgetColor: AppColors.green,
                              ),
                              child: Checkbox(
                                activeColor: AppColors.white50,
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return const BorderSide(
                                          color: AppColors.white100);
                                    } else {
                                      return const BorderSide(
                                          color: AppColors.black700);
                                    }
                                  },
                                ),
                                value: controller.isRememberme.value,
                                checkColor: AppColors.green,
                                fillColor: const WidgetStatePropertyAll(
                                    AppColors.white100),
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.green),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 5.0))),
                                onChanged: (value) {
                                  controller.isRememberme.value = value!;
                                },
                              ),
                            ),
                          ),
                          const CustomText(
                            text: "Remember me",
                            color: AppColors.black800,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                        child: const CustomText(
                          text: "Forgot Password ?",
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      )
                    ],
                  ),
                  Gap(
                    height: 25.h,
                  ),
                  CustomButton(
                    height: 40,
                    onTap: () {
                      controller.clickLoginButton();
                    },
                    fillColor: controller.isRememberme.value
                        ? AppColors.gray
                        : AppColors.black700,
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
          ),
        );
      },
    );
  }
}

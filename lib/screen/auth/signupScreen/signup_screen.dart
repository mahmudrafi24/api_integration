import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/screen/auth/signupScreen/controller/signup_controller.dart';
import 'package:loginsignup/utils/gap/app_size.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/button/app_button.dart';
import 'package:loginsignup/widget/inputs/app_inputs.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder(
        init: SignupController(),
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
                key: controller.signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        text: "SignUp",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(
                      height: 20.h,
                    ),
                    CustomText(
                      text: "Full Name",
                      fontFamily: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(
                      height: 10.h,
                    ),
                    AppInputWidget(
                      controller: controller.fullNameTextEditingController,
                      hintText: "Enter your Full Name",
                      keyboardType: TextInputType.name,
                      fillColor: AppColors.black50,
                      filled: true,
                      maxLines: 1,
                      isEmail: false,
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
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isChecked,
                          onChanged: (bool? newValue) {
                            controller.toggleCheckbox(newValue);
                          },
                          activeColor: AppColors.black600,
                        ),
                        CustomText(
                          text: "I agree to the terms and conditions",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black600,
                          fontFamily: 1,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Gap(
                      height: 25.h,
                    ),
                    CustomButton(
                      height: 40,
                      onTap: () {
                        controller.taponSignupButton();
                      },
                      fillColor: controller.isChecked
                          ? AppColors.black700
                          : AppColors.black500,
                      textColor: AppColors.white100,
                      title: "Sign Up",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Already have an account?",
                          fontFamily: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        Gap(
                          width: 03.h,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.login),
                          child: CustomText(
                            text: "Login",
                            fontFamily: 1,
                            fontWeight: FontWeight.w500,
                            color: AppColors.green,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } // Initialize the controller here

        );
  }
}

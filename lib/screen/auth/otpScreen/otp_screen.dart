import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/screen/auth/otpScreen/controller/otp_controller.dart';
import 'package:loginsignup/utils/gap/app_size.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/button/app_button.dart';
import 'package:loginsignup/widget/inputs/otp_inputs.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OtpController(),
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
              padding: EdgeInsets.all(20),
              child: Form(
                key: controller.verificationKey,
                child: Column(
                  children: [
                    Center(
                      child: Obx(
                        () => CustomText(
                          text: controller.isEmailVerification.value
                              ? "Verify your Email Address"
                              : "Enter the verification code",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Gap(
                      height: 20.h,
                    ),
                    Obx(
                      () => CustomText(
                        text: controller.isEmailVerification.value
                            ? "A verfication code has set to you"
                            : "Enter your email account to reset Password",
                      ),
                    ),
                    Gap(
                      height: 10.h,
                    ),
                    Obx(
                      () => !controller.isEmailVerification.value
                          ? const SizedBox()
                          : CustomText(
                              text: controller.argMail.value,
                            ),
                    ),
                    Gap(
                      height: 15.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInputFieldWidget(
                            controller: controller.otp1TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                          OtpInputFieldWidget(
                            controller: controller.otp2TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                          OtpInputFieldWidget(
                            controller: controller.otp3TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                          OtpInputFieldWidget(
                            controller: controller.otp4TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                          OtpInputFieldWidget(
                            controller: controller.otp5TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                          OtpInputFieldWidget(
                            controller: controller.otp6TextEditingController,
                            fillColor: AppColors.white100,
                          ),
                        ]),
                    Gap(height: 15.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(() => CustomText(
                          text:
                              "Send Code Again : ${controller.formatTime(controller.seconds.value)}")),
                    ),
                    Gap(
                      height: 15.h,
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.black300,
                              ),
                            )
                          : CustomButton(
                              onTap: () {
                                controller.clickVerificationButton();
                              },
                              fillColor: AppColors.black700,
                              textColor: AppColors.white100,
                              title: "Continue",
                              height: 40,
                            ),
                    ),
                    Gap(
                      height: 20.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomText(
                        text: "Didn't receive the code?",
                      ),
                      Gap(
                        width: 5.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.reCallStatTimer();
                          },
                          child: Obx(() => CustomText(
                                text: "Resend",
                                color: controller.seconds.value == 0
                                    ? AppColors.green
                                    : AppColors.white502,
                              ))),
                    ])
                  ],
                ),
              ),
            ),
          );
        });
  }
}

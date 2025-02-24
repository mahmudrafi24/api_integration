import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/button/app_button.dart';
import 'package:loginsignup/widget/inputs/otp_inputs.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: "OTP Verification",
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(
              height: 20.h,
            ),
            CustomText(
              text: "A verification code has been sent to your email",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Gap(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) {
                  return OtpInputFieldWidget(
                    fillColor: AppColors.white100,
                  );
                },
              ),
            ),
            Gap(
              height: 20.h,
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.resetPassword);
              },
              fillColor: AppColors.black700,
              textColor: AppColors.white100,
              title: "Verify OTP",
            )
          ],
        ),
      ),
    );
  }
}

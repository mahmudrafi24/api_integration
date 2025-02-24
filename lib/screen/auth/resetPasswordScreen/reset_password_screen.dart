import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/button/app_button.dart';
import 'package:loginsignup/widget/inputs/app_inputs.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                text: "Reset Password",
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
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
            ),
            Gap(
              height: 25.h,
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.login);
              },
              fillColor: AppColors.black700,
              textColor: AppColors.white100,
              title: "Reset Password",
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/app_colors.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/screen/errorScreen/controller/error_controller.dart';
import 'package:loginsignup/utils/gap/app_size.dart';
import 'package:loginsignup/utils/gap/gap.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder(
      init: ErrorScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Icon(
                    controller.isInternetProblem.value ? Icons.signal_wifi_off_outlined : Icons.error_outline_rounded,
                    size: AppSize.width(value: 100),
                  ),
                ),
                const Gap(height: 20),
                Obx(() => CustomText(text: controller.errorMessage.value)),
                Obx(() => controller.isInternetProblem.value
                    ? Padding(
                        padding: EdgeInsets.all(AppSize.width(value: 10)),
                        child: const CustomText(text: "Check your internet connection",)
                      )
                    : const SizedBox()),
                const Gap(height: 30),
                GestureDetector(
                  onTap: () async {
                    await Get.offAllNamed(AppRoutes.home);
                  },
                  child: const CustomText(text: "Try again...",color: AppColors.primary,)
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

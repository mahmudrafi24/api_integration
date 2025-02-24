import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/screen/splashScreen/controller/splash_screen_controller.dart';
import 'package:loginsignup/utils/gap/app_size.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder(
      init: SplashScreenController(), // Initialize the controller
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 70),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CustomText(
                  text: "Welcome",
                  fontFamily: 1,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

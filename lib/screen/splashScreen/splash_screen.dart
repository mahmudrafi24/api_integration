import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'dart:async'; // Import Timer
import 'package:loginsignup/widget/texts/custom_text.dart'; // Assuming this is your custom text widget

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(), // Initialize the controller
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.greenAccent],
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

// SplashController to manage state and navigation
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Navigate to BottomNavBar after 1 second
    Timer(const Duration(seconds: 4), () {
      // Replace `userType` with the actual value or logic to determine it
      String userType = "defaultUser"; // Example value
      Get.offAll(() => BottomNavBar(), arguments: userType);
    });
  }
}

// Placeholder for BottomNavBar (replace with your actual widget)
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: const Center(
        child: Text('Bottom Navigation Bar Screen'),
      ),
    );
  }
}

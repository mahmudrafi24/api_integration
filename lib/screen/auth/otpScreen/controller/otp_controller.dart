import 'dart:isolate';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/services/api/api_post_service.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEmailVerification = RxBool(false);
  RxBool isForgot = RxBool(false);
  GlobalKey<FormState> verificationKey = GlobalKey<FormState>();

  TextEditingController otp1TextEditingController = TextEditingController();
  TextEditingController otp2TextEditingController = TextEditingController();
  TextEditingController otp3TextEditingController = TextEditingController();
  TextEditingController otp4TextEditingController = TextEditingController();
  TextEditingController otp5TextEditingController = TextEditingController();
  TextEditingController otp6TextEditingController = TextEditingController();

  RxString argMail = RxString("");
  final RxInt _seconds = 0.obs;
  RxInt get seconds => _seconds;
  late Isolate _isolate;

  setArgData() {
    try {
      var argData = Get.arguments;

      if (argData.runtimeType != Null) {
        if (argData is String) {
          argMail.value = argData.toString();
        } else if (argData is Map) {
          argMail.value = argData["email"];
          isEmailVerification.value = argData["isForgot"] ?? false;
          isForgot.value = argData["isForgot"] ?? false;
        }
      }
      startTimer();
    } catch (e) {
      log("error form otp verification arg set data function : $e");
    }
  }

  clickVerificationButton() async {
    try {
      if (verificationKey.currentState!.validate()) {
        isLoading.value = true;
        String merge =
            "${otp1TextEditingController.text}${otp2TextEditingController.text}${otp3TextEditingController.text}${otp4TextEditingController.text}${otp5TextEditingController.text}${otp6TextEditingController.text}";
        int otpMerge = int.parse(merge);

        var data = await ApiPostServices().apiPostServices(
          url: AppUrl.verifyEmail,
          body: {"email": argMail.value, "oneTimeCode": otpMerge},
        );

        if (data != null) {
          if (isForgot.value) {
             AppSnackBar.success("Authentication successful");
            Get.toNamed(AppRoutes.resetPassword);
            return;
          }

          Get.offAllNamed(AppRoutes.login);
          AppSnackBar.success("Authentication successful");
        }
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      log("error from clickVerificationButton function : $e");
    } finally {
      isLoading.value = false;
    }
  }

  clickResendOTP() async {
    try {
      var url = AppUrl.baseUrl;
      var data = await ApiPostServices().apiPostServices(
          url: "$url/auth/forgot-password", body: {"email": argMail.value});
      if (data != null) {
        AppSnackBar.success("OTP sent successfully");
        startTimer();
      }
    } catch (e) {
      log("error from clickResendOTP function : $e");
    } finally {
      isLoading.value = false;
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    if (minutes > 0) {
      return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '$remainingSeconds';
    }
  }

  void startTimer() async {
    try {
      final receivePort = ReceivePort();
      _isolate = await Isolate.spawn(_isolateEntryPoint, receivePort.sendPort);
      receivePort.listen((data) {
        _seconds.value = data as int;
        if (_seconds.value <= 0) {
          stopTimer();
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  reCallStatTimer() {
    if (seconds.value == 0) {
      startTimer();
      // Call to Send OTP
      clickResendOTP();
    }
  }

  void stopTimer() {
    try {
      _isolate.kill(priority: Isolate.immediate);
      _seconds.value = 0;
    } catch (e) {
      log(e.toString());
    }
  }

  static void _isolateEntryPoint(SendPort sendPort) {
    int seconds = 120;

    void timerCallback(Timer timer) {
      seconds--;
      sendPort.send(seconds);
      if (seconds <= 0) {
        timer.cancel();
      }
    }

    Timer.periodic(const Duration(seconds: 1), timerCallback);
  }

  @override
  void onClose() {
    super.onClose();
    stopTimer();
  }

  @override
  void onInit() {
    super.onInit();
    setArgData();
  }
}

import 'package:get/get.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/routes/bindings/app_auth_bindings.dart';
import 'package:loginsignup/routes/bindings/app_initial_bindings.dart';
import 'package:loginsignup/routes/internet_check_middleware.dart';
import 'package:loginsignup/screen/auth/forgorPasswordScreen/forgot_password_screen.dart';
import 'package:loginsignup/screen/auth/loginScreen/login_screen.dart';
import 'package:loginsignup/screen/auth/otpScreen/otp_screen.dart';
import 'package:loginsignup/screen/auth/resetPasswordScreen/reset_password_screen.dart';
import 'package:loginsignup/screen/auth/signupScreen/signup_screen.dart';
import 'package:loginsignup/screen/homeScreen/home_screen.dart';
import 'package:loginsignup/screen/splashScreen/splash_screen.dart';

List<GetPage> appRoutesFile = <GetPage>[
  ///Initail Page
  GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
      binding: AppInitialBindings(),
      middlewares: [InternetCheckMiddleWare()]),
  //

  // Home Screen
  GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      middlewares: [InternetCheckMiddleWare()]),

  // Sign up
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignupScreen(),
    binding: AppAuthBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  // Login Screen
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: AppAuthBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  // Forgot Password
  GetPage(
    name: AppRoutes.forgotPassword,
    page: () => const ForgotPasswordScreen(),
    binding: AppAuthBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  //Otp Screen
  GetPage(
    name: AppRoutes.otpScreen,
    page: () => const OtpScreen(),
    binding: AppAuthBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  //Reset Password
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordScreen(),
    binding: AppAuthBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),
];

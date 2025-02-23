import 'package:get/get.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/routes/bindings/app_initial_bindings.dart';
import 'package:loginsignup/routes/internet_check_middleware.dart';
import 'package:loginsignup/screen/splashScreen/splash_screen.dart';

List<GetPage> appRoutesFile = <GetPage>[
  ///Initail Page
  GetPage(name: AppRoutes.initial,
   page: () => const SplashScreen(),
   binding: AppInitialBindings(),
   middlewares: [InternetCheckMiddleWare()]
   ),

];

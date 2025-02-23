import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/app_routes_files.dart';
import 'utils/themeData/theme_data.dart';

class MainAppEntry extends StatelessWidget {
  const MainAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Practice API",
      enableLog: true,
      initialRoute: AppRoutes.initial,
      theme: appThemeData,
      getPages: appRoutesFile,
      defaultTransition: Transition.zoom,
      themeMode: ThemeMode.light,
      defaultGlobalState: true,
      transitionDuration: const Duration(microseconds: 250),
    );
  }
}

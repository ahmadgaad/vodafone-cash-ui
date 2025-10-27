import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/core/routes/app_routes.dart';
import 'package:vodafone_ui_clone/core/routes/route_generator.dart';

import 'core/theme/app_theme.dart';

class VodafoneApp extends StatelessWidget {
  const VodafoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Vodafone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: AppRoutes.initial,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}

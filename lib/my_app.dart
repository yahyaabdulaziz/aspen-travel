import 'package:aspen_travel/presentation/ui/splash_screen/splash_screen.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const MaterialApp(
            title: AppStrings.aspenTravel,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}

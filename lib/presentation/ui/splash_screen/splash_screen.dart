import 'package:aspen_travel/presentation/ui/main_screen/main_screen.dart';
import 'package:aspen_travel/presentation/utils/app_assets.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          AppAssets.splashImage,
          fit: BoxFit.fill,
          width: 1.sw,
          height: 1.sh
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 90.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.aspen,
                style: TextStyle(
                    fontFamily: AppStrings.hiatus,
                    fontSize: 116.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsetsDirectional.only(start: 40.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.planYour,
                    style: TextStyle(
                        fontFamily: AppStrings.montserrat,
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${AppStrings.luxurious}\n${AppStrings.vacation}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppStrings.montserrat,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  bottom: 48.h, start: 32.w, end: 32.w, top: 24.h),
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: 16.h, horizontal: 44.w),
                    child: Text(AppStrings.explore,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppStrings.circularxx)),
                  )),
            )
          ],
        )
      ],
    ));
  }
}

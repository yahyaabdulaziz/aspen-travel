import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacilitiesItem extends StatelessWidget {
  String facilityPath;
  String facilityName;

  FacilitiesItem(
      {super.key, required this.facilityPath, required this.facilityName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16.h)),
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(facilityPath),
            SizedBox(height: 4.h),
            Text(facilityName,
                style: TextStyle(
                    fontFamily: AppStrings.montserrat,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: const Color(0xffB8B8B8)))
          ],
        ),
      ),
    );
  }
}

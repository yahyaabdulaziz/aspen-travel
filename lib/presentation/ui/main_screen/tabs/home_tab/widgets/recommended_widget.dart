import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/presentation/ui/product_details/product_details.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedWidget extends StatelessWidget {
  final ProductModel productModel;

  const RecommendedWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProductDetails(),
              settings: RouteSettings(arguments: productModel)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16.0.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color(0xFFF4F4F4), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0x2B97A0B2),
              spreadRadius: 0,
              blurRadius: 20.h,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.all(4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox(
                    height: 115.0,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset(
                            productModel.productImagePath ?? "",
                            width: double.infinity,
                            height: 100.0.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 12.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0.w, vertical: 6.0.h),
                            decoration: BoxDecoration(
                              color: const Color(0xff3A544F),
                              borderRadius: BorderRadius.circular(22.0.h),
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Text(
                              productModel.productPlacePeriod ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppStrings.montserrat,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  productModel.productPlaceName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.montserrat,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

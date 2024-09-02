import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/di/di.dart';
import 'package:aspen_travel/presentation/ui/product_details/cart_view_model.dart';
import 'package:aspen_travel/presentation/ui/product_details/widgets/facilities_item.dart';
import 'package:aspen_travel/presentation/utils/app_assets.dart';
import 'package:aspen_travel/presentation/utils/app_colors.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isLoading = true;
  late ProductModel args;
  bool isFavorite = false;
  final CartViewModel cartViewModel = getIt();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              )
            : Container(
                padding: const EdgeInsetsDirectional.all(12),
                color: Colors.white,
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SizedBox(
                      height: 360.0.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            args.productImagePath ?? "",
                            width: double.infinity,
                            height: 340.0.h,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            top: 20.h,
                            left: 15.w,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0.w, vertical: 6.0.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF3F8FE),
                                  borderRadius: BorderRadius.circular(12.0.h),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.grey.shade400,
                                  size: 22.h,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 12.w,
                              child: InkWell(
                                onTap: () {
                                  args.isFaviroute = true;
                                  if (isFavorite == true) {
                                    cartViewModel.removeProductFromCart(
                                        args.productPlaceName ?? "");
                                    args.isFaviroute = false;
                                  } else {
                                    cartViewModel.addProductToCart(
                                        args.productPlaceName ?? "");
                                    args.isFaviroute = true;
                                  }
                                  setState(() {
                                    isFavorite =
                                        !isFavorite; // Toggle the state
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: MaterialButton(
                                    shape: const CircleBorder(),
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(12),
                                    onPressed: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      size: 25.h,
                                      color:
                                          isFavorite ? Colors.red : Colors.grey,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Text(
                              args.productPlaceName ?? "",
                              style: TextStyle(
                                  fontFamily: AppStrings.montserrat,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                  color: const Color(0xff232323)),
                            ),
                            const Spacer(),
                            Text(
                              AppStrings.showMap,
                              style: TextStyle(
                                  fontFamily: AppStrings.montserrat,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: const Color(0xff176FF2)),
                            )
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 24.h),
                            Text(
                              " ${args.productPlaceRate} (${args.productPlaceReviews} ${AppStrings.reviews})",
                              style: TextStyle(
                                  fontFamily: AppStrings.montserrat,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: const Color(0xff606060)),
                            )
                          ],
                        ),
                        SizedBox(height: 18.h),
                        ReadMoreText(
                          args.productPlaceDescription ?? "",
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: AppStrings.readMore,
                          trimExpandedText: AppStrings.readLess,
                          moreStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff176FF2)),
                          lessStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff176FF2),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppStrings.facilities,
                              style: TextStyle(
                                  fontFamily: AppStrings.montserrat,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: const Color(0xff232323)),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilitiesItem(
                                    facilityPath: AppAssets.wifiImg,
                                    facilityName: AppStrings.oneHeater),
                                FacilitiesItem(
                                    facilityPath: AppAssets.foodImg,
                                    facilityName: AppStrings.dinner),
                                FacilitiesItem(
                                    facilityPath: AppAssets.bathImg,
                                    facilityName: AppStrings.oneTub),
                                FacilitiesItem(
                                    facilityPath: AppAssets.poolImg,
                                    facilityName: AppStrings.pool),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(vertical: 4.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(AppStrings.price,
                                      style: TextStyle(
                                          fontFamily: AppStrings.montserrat,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: const Color(0xff232323))),
                                  Text("\$${args.productPlacePrice}",
                                      style: TextStyle(
                                          fontFamily: AppStrings.montserrat,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.sp,
                                          color: const Color(0xff2DD7A4)))
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff176FF2),
                                      Color(0xff196EEE),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x3D0038FF),
                                      spreadRadius: 0,
                                      blurRadius: 19.h,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 16.h,
                                  horizontal: 32.w,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "${AppStrings.bookNow}  ",
                                      style: TextStyle(
                                        fontFamily: AppStrings.montserrat,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: const Color(0xffFFFFFF),
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ])));
  }
}

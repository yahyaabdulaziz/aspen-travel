import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/di/di.dart';
import 'package:aspen_travel/presentation/ui/product_details/cart_view_model.dart';
import 'package:aspen_travel/presentation/ui/product_details/product_details.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularWidget extends StatefulWidget {
  final ProductModel productModel;

  const PopularWidget({super.key, required this.productModel});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  bool isFavorite = false;
  final CartViewModel cartViewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProductDetails(),
              settings: RouteSettings(arguments: widget.productModel)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.red,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: Image.asset(
                widget.productModel.productImagePath ?? "",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 15.h,
              left: 10.w,
              right: 10.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // place name
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff4D5652),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Text(
                          widget.productModel.productPlaceName ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            fontFamily: AppStrings.montserrat,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff4D5652),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18.h),
                            Text(
                              "  ${widget.productModel.productPlaceRate ?? ""}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                fontFamily: AppStrings.montserrat,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite; // Toggle the state
                      });
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        shape: const CircleBorder(),
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        onPressed: () {
                          if (isFavorite == true) {
                            cartViewModel.removeProductFromCart(
                                widget.productModel.productPlaceName ?? "");
                            widget.productModel.isFaviroute = false;
                          } else {
                            cartViewModel.addProductToCart(
                                widget.productModel.productPlaceName ?? "");
                            widget.productModel.isFaviroute = true;
                          }
                          setState(() {
                            isFavorite = !isFavorite; // Toggle the state
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 30.h,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey, // Change color based on state
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

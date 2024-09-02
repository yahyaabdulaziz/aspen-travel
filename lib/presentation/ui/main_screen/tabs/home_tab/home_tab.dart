import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/di/di.dart';
import 'package:aspen_travel/presentation/ui/main_screen/tabs/home_tab/home_tab_viewmodel.dart';
import 'package:aspen_travel/presentation/ui/main_screen/tabs/home_tab/widgets/popular_widget.dart';
import 'package:aspen_travel/presentation/ui/main_screen/tabs/home_tab/widgets/recommended_widget.dart';
import 'package:aspen_travel/presentation/utils/app_colors.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:aspen_travel/presentation/utils/base_request_states.dart';
import 'package:aspen_travel/presentation/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  HomeTabViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          viewModel.isLoading = false;
        });
      }
    });
    viewModel.loadLocations();
    viewModel.loadPopularProduct();
    viewModel.loadRecommendedProduct();
    viewModel.tabController =
        TabController(length: Constants.tabs.length, vsync: this);
    viewModel.tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    viewModel.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTabViewModel(
          viewModel.getLocationsUseCase,
          viewModel.getPopularProductUseCase,
          viewModel.getRecommendedProductUseCase),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildHomeAppBar(),
        body: buildHomeBody(),
      ),
    );
  }

  AppBar buildHomeAppBar() => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.explore,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontFamily: AppStrings.montserrat),
                  ),
                  Text(
                    AppStrings.aspen,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32.sp,
                        color: AppColors.blackColor,
                        fontFamily: AppStrings.montserrat),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 18.h,
                  ),
                  SizedBox(width: 4.w),
                  _buildLocationsDropList()
                ],
              )
            ],
          ),
        ),
      );

  Widget _buildLocationsDropList() =>
      BlocBuilder<HomeTabViewModel, BaseRequestStates>(
        builder: (context, state) {
          if (state is GetLocationLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is GetLocationError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is GetLocationSuccess<List<String>>) {
            final locations = state.list;

            if (locations.isEmpty) {
              return const Center(child: Text('No locations available.'));
            }
            String? selectedValue = (viewModel.selectedLocation.isNotEmpty
                ? viewModel.selectedLocation
                : locations.first) as String?;

            return DropdownButton<String>(
              value: selectedValue,
              dropdownColor: Colors.white,
              icon: Transform.rotate(
                angle: 4.71,
                child: Icon(Icons.arrow_back_ios_sharp, size: 18.h),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: const Color(0xff606060),
                fontFamily: AppStrings.montserrat,
              ),
              alignment: Alignment.center,
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    viewModel.selectedLocation = newValue;
                  });
                }
              },
              items: locations
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  } as DropdownMenuItem<String> Function(List<String> e))
                  .toList(),
            );
          }
          return const Center(child: Text("Error"));
        },
      );

  Widget buildHomeBody() => BlocProvider<HomeTabViewModel>(
        create: (context) => viewModel,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xffF3F8FE),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey, size: 22.h),
                  SizedBox(width: 10.h),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          fontFamily: AppStrings.montserrat,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000),
                          fontSize: 13.sp),
                      decoration: const InputDecoration(
                        hintText: AppStrings.findThingsTodo,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: viewModel.tabController,
                isScrollable: true,
                dividerColor: Colors.white,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                tabs: List.generate(
                    Constants.tabs.length, (index) => _buildTab(index)),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: viewModel.tabController,
                children: List.generate(
                    Constants.tabs.length, (index) => _buildTabContent(index)),
              ),
            ),
          ],
        ),
      );

  Widget _buildTab(int index) {
    bool isSelected = viewModel.tabController.index == index;
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    const Color(0xFF176FF2).withOpacity(0.05),
                    const Color(0xFF196EEE).withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          Constants.tabs[index],
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    if (index == 0) {
      return BlocBuilder<HomeTabViewModel, BaseRequestStates>(
        builder: (context, state) {
          if (state is BaseRequestLoadingState) {
            return const Center(
                child:
                    CircularProgressIndicator(color: AppColors.primaryColor));
          } else if (state is BaseRequestErrorState) {
            final message = state.message;
            return Center(child: Text(message));
          } else if (state is BaseRequestSuccessState) {
            List<ProductModel> data = [];
            data = state.data;
            final filteredPopularProducts = data
                .where((p) => p.isPopular == true && p.isRecommended == false)
                .toList();
            final filteredRecommendedProducts = data
                .where((p) => p.isPopular == false && p.isRecommended == true)
                .toList();

            return viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  )
                : Padding(
                    padding: EdgeInsets.all(12.0.h),
                    child: ListView(
                      children: [
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Text(AppStrings.popular,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppStrings.montserrat,
                                    color: const Color(0xff232323))),
                            const Spacer(),
                            Text(AppStrings.seeAll,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppStrings.montserrat,
                                    color: const Color(0xFF176FF2))),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        if (filteredPopularProducts.isEmpty)
                          const Center(
                              child: Text('No popular products available.'))
                        else
                          CarouselSlider(
                            items: filteredPopularProducts.map((product) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return PopularWidget(productModel: product);
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.7,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                disableCenter: true,
                                padEnds: false),
                          ),
                        SizedBox(height: 8.h),
                        Text(AppStrings.recommended,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppStrings.montserrat,
                                color: const Color(0xff232323))),
                        if (filteredRecommendedProducts.isEmpty)
                          const Center(
                              child: Text('No recommended products available.'))
                        else
                          CarouselSlider(
                            items: filteredRecommendedProducts.map((product) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return RecommendedWidget(
                                      productModel: product);
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 215.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.7,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              autoPlay: false,
                              padEnds: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                      ],
                    ),
                  );
          } else {
            return const Center(child: Text('Failed to load data'));
          }
        },
      );
    } else {
      return Center(
          child: Text('${AppStrings.contentFor} ${Constants.tabs[index]}'));
    }
  }
}

import 'package:aspen_travel/domain/usecases/get_locations_use_case.dart';
import 'package:aspen_travel/domain/usecases/get_popular_product_use_case.dart';
import 'package:aspen_travel/domain/usecases/get_recommeded_product_use_case.dart';
import 'package:aspen_travel/presentation/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<BaseRequestStates> {
  final GetPopularProductUseCase getPopularProductUseCase;
  final GetRecommendedProductUseCase getRecommendedProductUseCase;
  final GetLocationsUseCase getLocationsUseCase;

  late TabController tabController;
  String selectedLocation = "";
  bool isLoading = true;

  HomeTabViewModel(this.getLocationsUseCase, this.getPopularProductUseCase,
      this.getRecommendedProductUseCase)
      : super(BaseRequestInitialState()) {
    getPopularProductUseCase.stream.listen((state) {
      emit(state);
    });
    getRecommendedProductUseCase.stream.listen((state) {
      emit(state);
    });
    getLocationsUseCase.stream.listen((state) {
      emit(state);
    });
  }

  void loadLocations() {
    emit(GetLocationLoading());
    getLocationsUseCase.execute();
  }

  void loadPopularProduct() {
    emit(BaseRequestLoadingState());
    getPopularProductUseCase.execute();
  }

  void loadRecommendedProduct() {
    emit(BaseRequestLoadingState());
    getRecommendedProductUseCase.execute();
  }
}

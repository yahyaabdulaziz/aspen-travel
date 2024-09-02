import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/usecases/add_to_cart_use_case.dart';
import 'package:aspen_travel/domain/usecases/remove_from_cart_use_case.dart';
import 'package:aspen_travel/presentation/utils/base_request_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit {
  AddToCartUseCase addToCartUseCase;
  RemoveFromCartUseCase removeFromCartUseCase;
  ProductModel? productModel;

  CartViewModel(this.addToCartUseCase, this.removeFromCartUseCase)
      : super(BaseRequestInitialState());

  void addProductToCart(String name) async {
    Either<Failure, ProductModel> either = await addToCartUseCase.execute(name);
    either.fold((failure) {
      emit(BaseRequestErrorState(failure.errorMessage));
    }, (cart) {
      productModel = cart;
      emit(BaseRequestSuccessState());
    });
  }

  void removeProductFromCart(String name) async {
    Either<Failure, ProductModel> either =
        await removeFromCartUseCase.execute(name);
    either.fold((failure) {
      emit(BaseRequestErrorState(failure.errorMessage));
    }, (cart) {
      productModel = cart;
      emit(BaseRequestSuccessState());
    });
  }
}

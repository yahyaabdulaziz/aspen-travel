import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/repo/main_repo/main_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  MainRepo repo;

  AddToCartUseCase(this.repo);

  Future<Either<Failure, ProductModel>> execute(String name) {
    return repo.addProductToCart(name);
  }
}

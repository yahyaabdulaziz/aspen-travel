import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepo {
  Future<Either<Failure, List<String>>> getLocations();

  Future<Either<Failure, List<ProductModel>>> getPopularProduct();

  Future<Either<Failure, List<ProductModel>>> getRecommendedProduct();

  Future<Either<Failure, ProductModel>> addProductToCart(String name);

  Future<Either<Failure, ProductModel>> removeProductFromCart(String name);
}

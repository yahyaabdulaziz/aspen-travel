import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/repo/main_repo/data_source/main_online_ds.dart';
import 'package:aspen_travel/presentation/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainOnlineDS)
class MainOnlineDSImpl extends MainOnlineDS {
  @override
  Future<Either<Failure, List<String>>> getLocations() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Returning mock data for locations');
    List<String> locations = Constants.locations;
    return Right(locations);
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getPopularProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Returning mock data for popular products');
    List<ProductModel> popularProducts = Constants.carouselItems;
    return Right(popularProducts);
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getRecommendedProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Returning mock data for recommended products');
    List<ProductModel> recommendedProducts = Constants.carouselItems;
    return Right(recommendedProducts);
  }

  @override
  Future<Either<Failure, ProductModel>> addProductToCart(String name) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductModel>> removeProductFromCart(String name) {
    throw UnimplementedError();
  }
}

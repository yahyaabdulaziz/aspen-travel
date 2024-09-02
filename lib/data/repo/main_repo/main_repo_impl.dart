import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/repo/main_repo/data_source/main_online_ds.dart';
import 'package:aspen_travel/domain/repo/main_repo/main_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  MainOnlineDS mainOnlineDs;

  MainRepoImpl(this.mainOnlineDs);

  @override
  Future<Either<Failure, List<String>>> getLocations() {
    return mainOnlineDs.getLocations();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getPopularProduct() async {
    return mainOnlineDs.getPopularProduct();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getRecommendedProduct() async {
    return mainOnlineDs.getRecommendedProduct();
  }

  @override
  Future<Either<Failure, ProductModel>> addProductToCart(String name) async {
    return mainOnlineDs.addProductToCart(name);
  }

  @override
  Future<Either<Failure, ProductModel>> removeProductFromCart(
      String name) async {
    return mainOnlineDs.removeProductFromCart(name);
  }
}

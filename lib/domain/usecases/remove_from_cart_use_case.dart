import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/repo/main_repo/main_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromCartUseCase {
  MainRepo repo;

  RemoveFromCartUseCase(this.repo);

  Future<Either<Failure, ProductModel>> execute(String id) {
    return repo.removeProductFromCart(id);
  }
}

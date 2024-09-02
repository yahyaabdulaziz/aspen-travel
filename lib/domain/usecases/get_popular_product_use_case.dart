import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/data/model/product_model.dart';
import 'package:aspen_travel/domain/repo/main_repo/main_repo.dart';
import 'package:aspen_travel/presentation/utils/base_request_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularProductUseCase extends Cubit<BaseRequestStates> {
  GetPopularProductUseCase(this.repo) : super(BaseRequestInitialState());
  final MainRepo repo;

  void execute() async {
    print('Executing GetPopularProductUseCase...');
    emit(BaseRequestLoadingState());

    try {
      Either<Failure, List<ProductModel>> either =
          await repo.getPopularProduct();

      print('Repository call completed.');

      either.fold(
        (failure) {
          print('Failed to fetch popular products: ${failure.errorMessage}');
          emit(BaseRequestErrorState(failure.errorMessage));
        },
        (list) {
          print('Successfully fetched popular products. Count: ${list.length}');
          emit(BaseRequestSuccessState<List<ProductModel>>(data: list));
        },
      );
    } catch (e) {
      print('Exception occurred: $e');
      emit(BaseRequestErrorState('An unexpected error occurred'));
    }
  }
}

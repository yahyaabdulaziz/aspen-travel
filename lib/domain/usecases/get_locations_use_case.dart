import 'package:aspen_travel/data/model/failure.dart';
import 'package:aspen_travel/domain/repo/main_repo/main_repo.dart';
import 'package:aspen_travel/presentation/utils/base_request_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocationsUseCase extends Cubit<BaseRequestStates> {
  GetLocationsUseCase(this.repo) : super(BaseRequestInitialState());
  final MainRepo repo;

  void execute() async {
    print('Executing GetLocationUseCase...');
    emit(GetLocationLoading());

    try {
      Either<Failure, List<String>> either = await repo.getLocations();

      print('Repository call completed.');

      either.fold(
        (failure) {
          print('Failed to fetch Locations: ${failure.errorMessage}');
          emit(GetLocationError(failure.errorMessage));
        },
        (list) {
          print('Successfully fetched locations. Count: ${list.length}');
          emit(GetLocationSuccess(list));
        },
      );
    } catch (e) {
      print('Exception occurred: $e');
      emit(GetLocationError('An unexpected error occurred'));
    }
  }
}

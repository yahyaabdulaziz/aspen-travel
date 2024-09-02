abstract class BaseRequestStates {}

class BaseRequestInitialState extends BaseRequestStates {}

class BaseRequestLoadingState extends BaseRequestStates {}

class BaseRequestSuccessState<DataType> extends BaseRequestStates {
  final DataType? data;

  BaseRequestSuccessState({this.data});
}

class BaseRequestErrorState extends BaseRequestStates {
  String message;

  BaseRequestErrorState(this.message);
}

class GetLocationSuccess<String> extends BaseRequestStates {
  final List<String> list;

  GetLocationSuccess(this.list);
}

class GetLocationLoading extends BaseRequestStates {}

class GetLocationError extends BaseRequestStates {
  String message;

  GetLocationError(this.message);
}

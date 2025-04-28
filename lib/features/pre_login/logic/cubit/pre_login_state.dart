import '../../../../core/networking/api_error_handler/api_error_model.dart';

sealed class PreLoginState {
  const PreLoginState();
}

class PreLoginInitialState extends PreLoginState {
  const PreLoginInitialState();
}

class PreLoginSuccessState extends PreLoginState {
  const PreLoginSuccessState();
}

class PreLoginErrorState extends PreLoginState {
  final ApiErrorModel apiErrorModel;
  const PreLoginErrorState(this.apiErrorModel);
}

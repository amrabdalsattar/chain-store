import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_handler/api_error_model.dart';
import '../data/models/login_response_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _LoginInitial;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.error(ApiErrorModel apiErrorModel) = LoginErrorState;
  const factory LoginState.success(LoginResponseModel loginResponseModel) =
      LoginSuccessState;
}

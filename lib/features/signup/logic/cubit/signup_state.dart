import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _SignupInitialState;
  const factory SignupState.loading() = SignupLoadingState;
  const factory SignupState.error(ApiErrorModel apiErrorModel) =
      SignupErrorState;
  const factory SignupState.success(String confirmationMessage) =
      SignupSuccessState;
}

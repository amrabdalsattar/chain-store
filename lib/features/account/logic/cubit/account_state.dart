part of 'account_cubit.dart';

@freezed
class AccountState with _$ProfileState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.logoutLoading() = LogoutLoading;
  const factory AccountState.logoutSuccess() = LogoutSuccess;
  const factory AccountState.logoutError(String message) = LogoutError;
}

part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.logoutLoading() = ProfileLogoutLoading;
  const factory ProfileState.logoutSuccess() = ProfileLogoutSuccess;
  const factory ProfileState.logoutError(String message) = ProfileLogoutError;
}
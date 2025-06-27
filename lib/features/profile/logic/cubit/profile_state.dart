part of 'profile_cubit.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
}

class ProfileImagePickedState extends ProfileState {
  final File profileImage;
  const ProfileImagePickedState(this.profileImage);
}

class ProfileLocalErrorState extends ProfileState {
  final String error;
  const ProfileLocalErrorState(this.error);
}

// Update profile states

class ProfileUpdateInitialState extends ProfileState {
  final bool isEditModeOn;
  const ProfileUpdateInitialState(this.isEditModeOn);
}

class ProfileUpdateLoadingState extends ProfileState {
  const ProfileUpdateLoadingState();
}

class ProfileUpdateSuccessState extends ProfileState {
  const ProfileUpdateSuccessState();
}

class ProfileUpdateErrorState extends ProfileState {
  final ApiErrorModel apiErrorModel;
  const ProfileUpdateErrorState(this.apiErrorModel);
}

// Fetching Profile states

class FetchProfileSuccessState extends ProfileState {
  final CustomerData customerData;
  const FetchProfileSuccessState(this.customerData);
}

class FetchProfileErrorState extends ProfileState {
  final ApiErrorModel apiErrorModel;
  const FetchProfileErrorState(this.apiErrorModel);
}

class FetchProfileLoadingState extends ProfileState {
  const FetchProfileLoadingState();
}

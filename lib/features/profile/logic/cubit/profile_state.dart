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

class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState(this.error);
}

class ProfileUpdateInitialState extends ProfileState {
  final bool isEditModeOn;
  const ProfileUpdateInitialState(this.isEditModeOn);
}

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitialState());

  File profileImage = File('');
  String profileImageUrl = '';

  bool isEditModeOn = false;

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      profileImage = File(image.path);
      emit(ProfileImagePickedState(profileImage));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  void startUpdatingProfile() {
    isEditModeOn = true;
    emit(ProfileUpdateInitialState(isEditModeOn));
  }
}

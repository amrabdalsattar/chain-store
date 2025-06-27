import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/customer_profile_response_model.dart';
import '../../data/models/update_profile_request_model.dart';
import '../../data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo;
  ProfileCubit(this._repo) : super(const ProfileInitialState());

  File profileImage = File('');
  String profileImageUrl = '';

  bool isEditModeOn = false;

  String userName = SharedPreferencesHelper.getString(
    SharedPreferencesKeys.userName,
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      profileImage = File(image.path);
      emit(ProfileImagePickedState(profileImage));
    } catch (e) {
      emit(ProfileLocalErrorState(e.toString()));
    }
  }

  void startUpdatingProfileState() {
    isEditModeOn = true;
    emit(ProfileUpdateInitialState(isEditModeOn));
  }

  Future<void> updateProfile() async {
    emit(const ProfileUpdateLoadingState());
    final result = await _repo.updateCustomerProfile(
      UpdateProfileRequest(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        address: addressController.text,
        businessType: businessTypeController.text,
        imageUrl: profileImageUrl,
      ),
    );
    result.when(
      success: (success) {
        if (!isClosed) {
          SharedPreferencesHelper.setData(
            SharedPreferencesKeys.userName,
            nameController.text,
          );
          isEditModeOn = false;
          emit(const ProfileUpdateSuccessState());
        }
      },
      failure: (apiErrorModel) {
        if (!isClosed) {
          isEditModeOn = false;
          emit(ProfileUpdateErrorState(apiErrorModel));
        }
      },
    );
  }

  Future<void> fetchCustomerProfile() async {
    emit(const FetchProfileLoadingState());
    final result = await _repo.getCustomerProfile();
    result.when(
      success: (customerData) {
        if (!isClosed) {
          nameController.text = customerData.name ?? '';
          phoneNumberController.text = customerData.phoneNumber ?? '';
          addressController.text = customerData.address ?? '';
          businessTypeController.text = customerData.businessType ?? '';
          businessNameController.text = customerData.businessType ?? '';
          emailController.text = customerData.email ?? '';
          profileImageUrl = customerData.imageUrl ?? '';

          emit(FetchProfileSuccessState(customerData));
        }
      },
      failure: (apiErrorModel) {
        if (!isClosed) {
          emit(FetchProfileErrorState(apiErrorModel));
        }
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    businessTypeController.dispose();
    businessNameController.dispose();
    emailController.dispose();
    return super.close();
  }
}

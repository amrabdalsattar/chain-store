import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../logic/cubit/profile_cubit.dart';
import 'user_profile_image.dart';

class UserProfileImageBlocConsumer extends StatelessWidget {
  const UserProfileImageBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return BlocConsumer<ProfileCubit, ProfileState>(
      bloc: profileCubit,
      listenWhen:
          (previous, current) =>
              current is ProfileErrorState ||
              current is ProfileImagePickedState,
      buildWhen:
          (previous, current) =>
              current is ProfileImagePickedState ||
              current is ProfileInitialState,
      listener: (_, state) {
        if (state is ProfileErrorState) {
          DialogsHelper.showToastificationMessage(
            context: context,
            title: 'Error',
            description: state.error,
            type: ToastificationType.error,
            alignment: Alignment.topCenter,
          );
        }
      },
      builder: (_, state) {
        return UserProfileImage(
          imageProvider:
              state is ProfileImagePickedState
                  ? FileImage(state.profileImage)
                  : getProfileImage(profileCubit.profileImageUrl),
        );
      },
    );
  }

  ImageProvider getProfileImage(String profileImageUrl) {
    if (profileImageUrl.isNullOrEmpty() ||
        !profileImageUrl.startsWith('http')) {
      return const AssetImage(AppImages.connectChainLogo);
    } else {
      return CachedNetworkImageProvider(profileImageUrl);
    }
  }
}

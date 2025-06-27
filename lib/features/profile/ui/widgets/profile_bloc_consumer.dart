import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/profile_cubit.dart';
import 'profile_content.dart';

class ProfileBlocConsumer extends StatelessWidget {
  const ProfileBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current is ProfileUpdateSuccessState ||
              current is ProfileUpdateErrorState,
      buildWhen:
          (previous, current) =>
              current is FetchProfileLoadingState ||
              current is FetchProfileErrorState ||
              current is FetchProfileSuccessState,
      listener: (_, state) {
        switch (state) {
          case ProfileUpdateSuccessState():
            DialogsHelper.showBasicToast('Profile updated successfully');
          case ProfileUpdateErrorState():
            DialogsHelper.showToastificationMessage(
              context: context,
              alignment: Alignment.topCenter,
              title: 'Error',
              description:
                  state.apiErrorModel.getErrorMessages() ??
                  'Unexpected Error occurred',
              type: ToastificationType.error,
            );
          default:
        }
      },
      builder: (_, state) {
        switch (state) {
          case FetchProfileLoadingState():
            return const LoadingIndicator();
          case FetchProfileErrorState():
            return _buildText(
              state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
            );
          case FetchProfileSuccessState():
            return const ProfileContent();
          default:
            return _buildText('Unknown Error');
        }
      },
    );
  }

  Widget _buildText(String message) {
    return Center(child: Text(message, style: AppTextStyles.robotoBlackBold14));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/profile_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen:
          (previous, current) =>
              current is ProfileUpdateInitialState ||
              current is ProfileUpdateLoadingState ||
              current is ProfileUpdateSuccessState ||
              current is ProfileUpdateErrorState,
      builder: (_, state) {
        if (state is ProfileUpdateLoadingState) {
          return const LoadingIndicator(strokeThickness: 2);
        } else {
          return Visibility(
            visible: context.read<ProfileCubit>().isEditModeOn,
            child: GestureDetector(
              onTap: () {
                context.read<ProfileCubit>().updateProfile();
              },
              child: Text(
                'Save',
                style: AppTextStyles.rubikPrimaryMedium12.copyWith(
                  fontSize: 15.sp,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

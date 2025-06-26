import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../logic/cubit/profile_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => current is ProfileUpdateInitialState,
      builder:
          (_, state) => Visibility(
            visible: state is ProfileUpdateInitialState,
            child: Text(
              'Save',
              style: AppTextStyles.rubikPrimaryMedium12.copyWith(
                fontSize: 15.sp,
              ),
            ),
          ),
    );
  }
}

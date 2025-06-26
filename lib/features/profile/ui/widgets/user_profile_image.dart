import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../logic/cubit/profile_cubit.dart';

class UserProfileImage extends StatelessWidget {
  final ImageProvider imageProvider;
  const UserProfileImage({super.key, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ProfileCubit>().pickProfileImage();
          },
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 42.r,
                  backgroundColor: ColorsHelper.white,
                  backgroundImage: imageProvider,
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorsHelper.backgroundScaffoldColor,
                        width: 2.r,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: ColorsHelper.primaryColor,
                      child: Icon(
                        Icons.edit,
                        size: 18.r,
                        color: ColorsHelper.white,
                      ),
                    ),
                  ),
                  bottom: -5.h,
                  right: 1.w,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(12),
        Text(
          SharedPreferencesHelper.getString(SharedPreferencesKeys.userName),
          style: AppTextStyles.rubikBlackBold16,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../logic/cubit/profile_cubit.dart';

class UserDataTextField extends StatelessWidget {
  final String? labelText;
  final bool labeled;
  final TextEditingController? controller;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const UserDataTextField({
    super.key,
    this.labelText,
    this.controller,
    this.enabled = true,
    this.keyboardType,
    this.labeled = true,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
        textInputAction: textInputAction ?? TextInputAction.done,
        controller: controller,
        keyboardType: keyboardType,
        style: AppTextStyles.rubikBlackRegular14,
        textCapitalization:
            keyboardType == TextInputType.name
                ? TextCapitalization.words
                : TextCapitalization.none,
        onChanged: (value) {
          if (!profileCubit.isEditModeOn) {
            profileCubit.startUpdatingProfileState();
          } else {
            return;
          }
        },
        enabled: enabled,
        decoration: InputDecoration(
          label:
              labeled
                  ? Text(
                    labelText!,
                    style: AppTextStyles.rubikSemiGreyRegular12,
                  )
                  : null,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: ColorsHelper.dividerGray),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.primaryColor, width: 1),
          ),
        ),
      ),
    );
  }
}

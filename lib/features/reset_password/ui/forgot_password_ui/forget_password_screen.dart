import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/constant_string.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/screen_label.dart';
import 'widgets/forget_password_button_bloc_consumer.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(27),
                Image.asset(AppImages.forgetPassword),
                const ScreenLabel(
                  title: ConstantString.forgetPassword,
                  subTitle:
                      'Don’t worry—just enter your email address below, and we’ll send you a verification code to reset your password.',
                ),
                verticalSpace(24),
                Text(
                  ConstantString.email,
                  style: AppTextStyles.rubikDarkGrayBold16,
                ),
                verticalSpace(8),
                const ForgetPasswordForm(),
                verticalSpace(32),
                const ForgetPasswordButtonBlocConsumer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/actionable_text_row.dart';
import '../../../core/widgets/logo.dart';
import '../../../core/widgets/screen_label.dart';
import '../../../core/widgets/social_media_registration_widgets.dart';
import 'widgets/signup_button_bloc_consumer.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 32.w,
            right: 32.w,
            top: 30.h,
            bottom: 24.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                horizontalSpace(double.infinity),
                const Logo(height: 61, width: 51),
                const ScreenLabel(
                  title: 'Create a new account.',
                  subTitle: 'Sign up and start managing your orders with ease!',
                ),
                verticalSpace(48),
                const SignupForm(),
                verticalSpace(40),
                const SignupButtonBlocConsumer(),
                verticalSpace(24),
                const SocialMediaRegistrationWidgets(),
                verticalSpace(24),
                ActionableTextRow(
                  onTap: () {
                    context.pop();
                  },
                  text: 'Do you have an account?',
                  actionText: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

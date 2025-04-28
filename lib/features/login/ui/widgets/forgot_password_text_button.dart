import 'package:flutter/material.dart';

import '../../../../core/helpers/constant_string.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  final void Function()? onPressed;
  const ForgotPasswordTextButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1, 1),
      child: TextButton(
        onPressed: () {
          context.pushNamed(Routes.forgetPasswordScreenRoute);
        },
        child: Text(
          ConstantString.forgetPassword,
          style: AppTextStyles.robotoPrimaryMedium15,
        ),
      ),
    );
  }
}

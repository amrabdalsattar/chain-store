import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';

class AppInformations extends StatelessWidget {
  const AppInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.aboutUsScreenRoute);
          },
          child: Text('About us', style: AppTextStyles.rubikPrimaryRegular12),
        ),
        horizontalSpace(8),
        const Text('|'),
        horizontalSpace(8),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.privacyPolicyScreenRoute);
          },
          child: Text(
            'Privacy Policy',
            style: AppTextStyles.rubikPrimaryRegular12,
          ),
        ),
      ],
    );
  }
}

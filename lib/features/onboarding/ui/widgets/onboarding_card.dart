import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/logo.dart';
import '../../data/models/onboarding_page_model.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingPageModel onboardingPageModel;
  const OnboardingCard({super.key, required this.onboardingPageModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(onboardingPageModel.imagePath),
        verticalSpace(35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 32, height: 32),
            horizontalSpace(18),
            Text(
              onboardingPageModel.title,
              style: AppTextStyles.rubikPrimaryBold20,
            ),
          ],
        ),
        verticalSpace(18),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            onboardingPageModel.description,
            style: AppTextStyles.robotoFadedBlackRegular16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

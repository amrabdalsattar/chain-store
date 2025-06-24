import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../data/app_info_data_sources.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> privacyPolicySections =
        AppInfoDataSources.privacyPolicySections;

    return Scaffold(
      appBar: const BasicAppBar(title: 'Privacy Policy'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Effective Date: June 30.2025',
                style: AppTextStyles.robotoPrimaryMedium15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    privacyPolicySections.map((section) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              section['label']!,
                              style:
                                  AppTextStyles
                                      .robotoBlackMedium14, // or your title style
                            ),
                            verticalSpace(10),
                            Text(
                              section['content']!,
                              style: AppTextStyles.robotoBlackRegular12,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

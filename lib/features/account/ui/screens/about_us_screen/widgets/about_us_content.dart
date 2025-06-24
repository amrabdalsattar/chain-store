import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../data/app_info_data_sources.dart';
import 'about_us_dialog.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> aboutUsData =
        AppInfoDataSources.aboutUsData;

    return Padding(
      padding: EdgeInsetsDirectional.only(end: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(aboutUsData.length, (index) {
          final data = aboutUsData[index];
          return AboutUsDialog(
            title: data['title']!,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 2) _buildWhatWeOfferDetails(),
                if (index == 3) _buildOurValuesDetails(),
                Text(
                  data['content']!,
                  style: AppTextStyles.robotoBlackRegular12,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildWhatWeOfferDetails() {
    const items = [
      'Verified Suppliers',
      'Trusted Transactions',
      'Quality Products',
      'Support & Guidance',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: List.generate(2, (columnIndex) {
          final startIndex = columnIndex * 2;
          return Expanded(
            child: Column(
              children: List.generate(2, (rowIndex) {
                final text = items[startIndex + rowIndex];
                return _buildCheckItem(text);
              }),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildOurValuesDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(child: _buildCheckItem('Trust & Transparency')),
          Expanded(child: _buildCheckItem('Operational Excellence')),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(Icons.check, size: 18.r),
          horizontalSpace(6),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(text, style: AppTextStyles.robotoBlackRegular12),
            ),
          ),
        ],
      ),
    );
  }
}

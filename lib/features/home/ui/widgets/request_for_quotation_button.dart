import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class RequestForQuotationButton extends StatelessWidget {
  const RequestForQuotationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.rfqScreen);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 19.h),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorsHelper.boxShadow, blurRadius: 24.r),
          ],
          color: ColorsHelper.primaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.edit_outlined, color: ColorsHelper.white),
            horizontalSpace(2.5),
            Text(
              'Request For Quotation',
              style: AppTextStyles.rubikWhiteBold14,
            ),
          ],
        ),
      ),
    );
  }
}

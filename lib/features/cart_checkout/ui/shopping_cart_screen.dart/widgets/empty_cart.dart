import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/widgets/custom_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.emptyCart),
          verticalSpace(16),
          Text('Your cart is empty', style: AppTextStyles.rubikBlackBold20),
          verticalSpace(8),
          Text(
            'Looks like you haven’t added any items yet.',
            style: AppTextStyles.robotoBlackRegular12,
            textAlign: TextAlign.center,
          ),
          verticalSpace(32),
          CustomButton(
            title: 'Start Shopping',
            width: double.infinity,
            radius: 32,
            height: 41,
            borderColor: ColorsHelper.primaryColor,

            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}

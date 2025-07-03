import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';

class QuotationSuccessScreen extends StatelessWidget {
  const QuotationSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotation Success', style: AppTextStyles.rubikBlackBold20),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: ColorsHelper.primaryColor,
                size: 120.sp,
              ),
              verticalSpace(32),
              Text(
                'Your quotation was submitted successfully!',
                style: AppTextStyles.rubikBlackBold20,
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              Text(
                'We are matching you with the best suppliers. You can view matched suppliers once available.',
                style: AppTextStyles.robotoBlackRegular12.copyWith(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(40),
              CustomButton(
                title: 'View RFQs',
                width: double.infinity,
                onTap: () async {

                  context.pushReplacementNamed(
                    Routes.manageRfQsScreenRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

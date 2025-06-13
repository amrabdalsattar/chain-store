import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';

class QuotationSuccess extends StatelessWidget {
  const QuotationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsHelper.primaryColor.withValues(alpha: 0.12),
            ),
            child: Icon(
              Icons.check_circle_outline,
              color: ColorsHelper.primaryColor,
              size: 80.sp,
            ),
          ),
          verticalSpace(24),
          Text(
            'Request Submitted!',
            style: AppTextStyles.rubikBlackBold24,
            textAlign: TextAlign.center,
          ),
          verticalSpace(16),
          Text(
            'Your quotation request has been sent. We will contact you soon.',
            style: AppTextStyles.rubikSemiGreyRegular12,
            textAlign: TextAlign.center,
          ),
          verticalSpace(40),
          BlocBuilder<QuotationCubit, QuotationState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.quotation != null) ...[
                    _buildReferenceItem(
                      'Product',
                      state.quotation!.productName,
                    ),
                    verticalSpace(12),
                    _buildReferenceItem(
                      'Quantity',
                      state.quotation!.quantity.toString(),
                    ),
                    verticalSpace(24),
                  ],
                  CustomButton(
                    title: 'Back to Home',
                    width: double.infinity,
                    radius: 12,
                    elevation: 2,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.mainScreenRoute,
                        (route) => false,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceItem(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(
            color: ColorsHelper.secondaryGray,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorsHelper.darkBlue,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

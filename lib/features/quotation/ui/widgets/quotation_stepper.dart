import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class QuotationStepper extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTapped;

  const QuotationStepper({
    super.key,
    required this.currentStep,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStepItem(
            index: 0,
            title: 'Product',
            isActive: currentStep >= 0,
            isCompleted: currentStep > 0,
          ),
          _buildConnector(isActive: currentStep > 0),
          _buildStepItem(
            index: 1,
            title: 'Contact',
            isActive: currentStep >= 1,
            isCompleted: currentStep > 1,
          ),
          _buildConnector(isActive: currentStep > 1),
          _buildStepItem(
            index: 2,
            title: 'Review',
            isActive: currentStep >= 2,
            isCompleted: false,
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required int index,
    required String title,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onStepTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 36.w : 30.w,
              height: isActive ? 36.w : 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isActive
                        ? ColorsHelper.primaryColor
                        : ColorsHelper.borderGray,
                boxShadow:
                    isActive
                        ? [
                          BoxShadow(
                            color: ColorsHelper.primaryColor.withValues(
                              alpha: 0.18,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : [],
              ),
              child: Center(
                child:
                    isCompleted
                        ? Icon(
                          Icons.check,
                          color: ColorsHelper.white,
                          size: 18.sp,
                        )
                        : Text(
                          '${index + 1}',
                          style: AppTextStyles.robotoWhiteBold16.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                color:
                    isActive
                        ? ColorsHelper.primaryColor
                        : ColorsHelper.secondaryGray,
                fontSize: 13.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector({required bool isActive}) {
    return Container(
      width: 30.w,
      height: 2.h,
      color: isActive ? ColorsHelper.primaryColor : ColorsHelper.borderGray,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Modern header with icon (if design requires)
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsHelper.primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.assignment_turned_in,
                  color: ColorsHelper.primaryColor,
                  size: 28.w,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review Your Request',
                    style: AppTextStyles.rubikBlackBold20,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Check your details before submitting',
                    style: AppTextStyles.rubikSemiGreyRegular12,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(28),
          _buildSectionTitle('Product Information'),
          verticalSpace(16),
          _buildInfoItem('Product Name', cubit.productNameController.text),
          verticalSpace(12),
          _buildInfoItem('Quantity', cubit.quantityController.text),
          if (cubit.notesController.text.isNotEmpty) ...[
            verticalSpace(12),
            _buildInfoItem('Additional Notes', cubit.notesController.text),
          ],
          verticalSpace(24),
          _buildSectionTitle('Contact Information'),
          verticalSpace(16),
          _buildInfoItem('Full Name', cubit.nameController.text),
          verticalSpace(12),
          _buildInfoItem('Email Address', cubit.emailController.text),
          verticalSpace(12),
          _buildInfoItem('Phone Number', cubit.phoneController.text),
          if (cubit.companyNameController.text.isNotEmpty) ...[
            verticalSpace(12),
            _buildInfoItem('Company Name', cubit.companyNameController.text),
          ],
          verticalSpace(32),
          BlocBuilder<QuotationCubit, QuotationState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: 'Back',
                      width: double.infinity,
                      color: ColorsHelper.white,
                      borderColor: ColorsHelper.primaryColor,
                      textStyle: AppTextStyles.rubikPrimaryBold16,
                      radius: 12,
                      elevation: 2,
                      onTap: cubit.previousStep,
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: CustomButton(
                      title: 'Submit',
                      width: double.infinity,
                      isLoading: state.isSubmitting,
                      radius: 12,
                      elevation: 2,
                      onTap: cubit.submitQuotation,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorsHelper.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ColorsHelper.primaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: ColorsHelper.secondaryGray,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            color: ColorsHelper.darkBlue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

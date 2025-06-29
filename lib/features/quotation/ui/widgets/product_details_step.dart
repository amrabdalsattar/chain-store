import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/cubit/quotation_cubit.dart';

class ProductDetailsStep extends StatelessWidget {
  const ProductDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Form(
        key: cubit.productFormKey,
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
                    Icons.shopping_bag,
                    color: ColorsHelper.primaryColor,
                    size: 28.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Details',
                      style: AppTextStyles.rubikBlackBold20,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Fill in the product information below',
                      style: AppTextStyles.rubikSemiGreyRegular12,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(28),
            CustomTextFormField(
              hintText: 'Product Name',
              prefixIconPath:
                  'assets/svgs/bags.png', // Use appropriate icon if available
              controller: cubit.productNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            CustomTextFormField(
              hintText: 'Quantity',
              prefixIconPath:
                  'assets/svgs/add.png', // Use appropriate icon if available
              controller: cubit.quantityController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter quantity';
                }
                if (int.tryParse(value) == null || int.parse(value) <= 0) {
                  return 'Please enter a valid quantity';
                }
                return null;
              },
            ),
            verticalSpace(18),
            CustomTextFormField(
              hintText: 'Additional Notes (Optional)',
              prefixIconPath:
                  'assets/svgs/note.svg', // Use appropriate icon if available
              controller: cubit.detailsController,
              maxLines: 4,
              validator: (_) => null,
            ),
            verticalSpace(32),
            // Example: Add a checkbox for terms if design requires
            // Row(
            //   children: [
            //     Checkbox(value: cubit.agreeToTerms, onChanged: cubit.toggleTerms),
            //     Expanded(child: Text('I agree to the terms and conditions', style: AppTextStyles.rubikSemiGreyRegular12)),
            //   ],
            // ),
            // verticalSpace(24),
            CustomButton(
              title: 'Next',
              width: double.infinity,
              radius: 12,
              elevation: 2,
              onTap: cubit.nextStep,
            ),
          ],
        ),
      ),
    );
  }
}

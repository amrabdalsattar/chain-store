import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/cubit/quotation_cubit.dart';

class ContactDetailsStep extends StatelessWidget {
  const ContactDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Form(
        key: cubit.contactFormKey,
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
                    Icons.person,
                    color: ColorsHelper.primaryColor,
                    size: 28.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: AppTextStyles.rubikBlackBold20,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Let us know how to reach you',
                      style: AppTextStyles.rubikSemiGreyRegular12,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(28),
            CustomTextFormField(
              hintText: 'Full Name',
              prefixIconPath: 'assets/svgs/person.svg',
              controller: cubit.nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            CustomTextFormField(
              hintText: 'Email Address',
              prefixIconPath: 'assets/svgs/email_icon.svg',
              controller: cubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            verticalSpace(18),
            CustomTextFormField(
              hintText: 'Phone Number',
              prefixIconPath: 'assets/svgs/phone.svg',
              controller: cubit.phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            verticalSpace(18),
            CustomTextFormField(
              hintText: 'Company Name (Optional)',
              prefixIconPath: 'assets/svgs/address.svg',
              controller: cubit.companyNameController,
              validator: (_) => null,
            ),
            verticalSpace(32),
            Row(
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
                    title: 'Next',
                    width: double.infinity,
                    radius: 12,
                    elevation: 2,
                    onTap: cubit.nextStep,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

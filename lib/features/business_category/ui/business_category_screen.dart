import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../logic/cubit/business_category_cubit.dart';
import 'widgets/custom_category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCategoryScreen extends StatelessWidget {
  const BusinessCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessCategoryCubit = context.read<BusinessCategoryCubit>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: BlocBuilder<BusinessCategoryCubit, BusinessCategoryState>(
          builder: (context, state) {
            return CustomButton(
              title: 'Continue',
              width: 342.w,
              isEnabled: businessCategoryCubit.isButtonEnabled,
              onTap:
                  businessCategoryCubit.isButtonEnabled
                      ? () {
                        businessCategoryCubit.submitCategories();
                        context.pushNamed(Routes.mainScreenRoute);
                      }
                      : null,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title of the page
                RichText(
                  text: TextSpan(
                    text: 'What',
                    style: AppTextStyles.rubikBlackBold24,
                    children: [
                      TextSpan(
                        text: ' type ',
                        style: AppTextStyles.rubikPrimaryBold24,
                      ),
                      TextSpan(
                        text: 'of business do you own?',
                        style: AppTextStyles.rubikBlackBold24,
                      ),
                    ],
                  ),
                ),
                verticalSpace(8),
                // subtitle of the Page
                Text(
                  'Choose your business category to help us tailor your experience.',
                  style: AppTextStyles.robotoBlackRegular14,
                ),
                verticalSpace(32),

                // Start of cateogires Section
                CategoriesList(businessCategoryCubit: businessCategoryCubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.businessCategoryCubit});

  final BusinessCategoryCubit businessCategoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCategoryCubit, BusinessCategoryState>(
      builder: (context, state) {
        return Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: List.generate(businessCategoryCubit.categories.length, (
            index,
          ) {
            final category = businessCategoryCubit.categories[index];
            return CustomCategoryChip(
              iconPath: category.iconPath,
              title: category.name,
            );
          }),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../logic/cubit/quotation_cubit.dart';
import 'widgets/contact_details_step.dart';
import 'widgets/product_details_step.dart';
import 'widgets/quotation_stepper.dart';
import 'widgets/quotation_success.dart';
import 'widgets/review_step.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuotationCubit(),
      child: const QuotationScreenContent(),
    );
  }
}

class QuotationScreenContent extends StatelessWidget {
  const QuotationScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();

    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: CustomAppBar(
        title: 'Request for Quotation',
        hideBackButton: false,
      ),
      body: BlocBuilder<QuotationCubit, QuotationState>(
        builder: (context, state) {
          if (state.isSubmitted) {
            return const QuotationSuccess();
          }
          
          return Column(
            children: [
              QuotationStepper(
                currentStep: cubit.currentStep,
                onStepTapped: cubit.goToStep,
              ),
              Expanded(
                child: _buildCurrentStep(cubit),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildCurrentStep(QuotationCubit cubit) {
    switch (cubit.currentStep) {
      case 0:
        return const ProductDetailsStep();
      case 1:
        return const ContactDetailsStep();
      case 2:
        return const ReviewStep();
      default:
        return const ProductDetailsStep();
    }
  }
}
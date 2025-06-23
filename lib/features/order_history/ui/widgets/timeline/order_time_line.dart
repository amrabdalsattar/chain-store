import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/widgets/custom_divider.dart';

part 'step_label.dart';
part 'timeline_step.dart';

class OrderTimeline extends StatelessWidget {
  final String currentStatus;

  const OrderTimeline({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    const steps = ['Packed', 'Shipping', 'Delivered'];

    final int currentStep = steps.indexOf(currentStatus);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: const CustomDivider(height: 0, haveSpace: false),
        ),
        verticalSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(steps.length, (index) {
                    return TimelineStep(
                      index: index,
                      steps: steps,
                      currentStep: currentStep,
                    );
                  }),
                ),
              ),
              verticalSpace(8),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    return StepLabel(
                      label: steps[index],
                      isStepped: index <= currentStep,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

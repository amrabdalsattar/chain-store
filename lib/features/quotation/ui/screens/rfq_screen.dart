import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';

part '../widgets/custom_rfq_section.dart';
part '../widgets/rfq_screen_content.dart';

class RfqScreen extends StatelessWidget {
  const RfqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuotationCubit, QuotationState>(
      listenWhen:
          (prev, curr) =>
              prev.errorMessage != curr.errorMessage ||
              prev.isSubmitted != curr.isSubmitted,
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          DialogsHelper.showErrorDialog(context, state.errorMessage!);
          context.read<QuotationCubit>().clearErrorMessage();
        }
        if (state.isSubmitted && state.rfqState == RFQState.newRFQState) {
          context.pushReplacementNamed(
            Routes.quotationSuccessScreenRoute,
            arguments: context.read<QuotationCubit>(),
          );
        }
      },
      child: const RFQScreenContent(),
    );
  }
}

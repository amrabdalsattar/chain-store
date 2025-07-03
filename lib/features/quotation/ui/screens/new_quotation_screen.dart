import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/utils/image_picker_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/custom_text_field_with_label.dart';
import '../../logic/cubit/quotation_cubit.dart';
import '../../logic/new_quotation_cubit/cubit/new_quotation_cubit.dart';
// Quotation Parts
part '../widgets/new_quotation_screen_content.dart';
part '../widgets/rfq_drop_down_menue.dart';
part '../widgets/rfq_form_section.dart';
part '../widgets/rfq_form.dart';
part '../widgets/rfq_details_text_field_with_ai.dart';
part '../widgets/custom_rfq_image_widget.dart';

class NewQuotationScreen extends StatelessWidget {
  const NewQuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewQuotationCubit, NewQuotationState>(
      listener: (context, state) {
        if (state is NewQuotationErrorState) {
          DialogsHelper.showErrorDialog(context, state.error.message ?? '');
        }
        if (state is NewQuotationCategorieFailedState) {
          DialogsHelper.showErrorDialog(context, state.error.message ?? '');
        }
        if (state is NewQuotationCategorieLoadingState) {
          DialogsHelper.showLoading(context);
        }

        if (state is NewQuotationSuccessState) {
          context.pop();
          context.pushReplacementNamed(
            Routes.quotationSuccessScreenRoute,
          );
        }
        if (state is NewQuotationLoadingState) {
          DialogsHelper.showLoading(context);
        }
      },

      child: const NewQuotationScreenContent(),
    );
  }
}

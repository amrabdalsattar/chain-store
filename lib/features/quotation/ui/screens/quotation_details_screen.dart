import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/quotation_model.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';
import '../../logic/manage_rfq_quotations_cubit/cubit/manage_rfq_quotations_cubit.dart';

// parts

part '../widgets/quotation_section_card.dart';
part '../widgets/quotation_contact_option.dart';
part '../widgets/quotation_details_bottom_sheet_widget.dart';
part '../widgets/quotation_accept_dialog.dart';
part '../widgets/quotation_action_button.dart';
part '../widgets/quotation_deatils_row.dart';
part '../widgets/quotation_decline_dialog.dart';
part '../widgets/quotation_details_app_bar.dart';
part '../widgets/quotation_details_header.dart';
part '../widgets/quotatoin_details_screen_content.dart';

class QuotationDetailsScreen extends StatelessWidget {
  final QuotationModel quotation;

  const QuotationDetailsScreen({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageRFQQuotationCubit, ManageRFQQuotationsState>(
      listener: (context, state) {
        state.whenOrNull(
          quotationResponseFailed:
              (error) =>
                  DialogsHelper.showErrorDialog(context, error.message ?? ''),
          quotationResponseLoading: () => DialogsHelper.showLoading(context),
          quotationResponseSuccess: () {
            DialogsHelper.showBasicToast('Done');
          context.pushReplacementNamed(Routes.manageRfQsScreenRoute);
          },
        );
      },
      child: Scaffold(
        backgroundColor: ColorsHelper.homeScaffoldColor,
        appBar: const QuotationDetailsAppBar(status: 'pending'),
        body: QuotatoinDetailsScreenContent(quotation: quotation),
      ),
    );
  }
}

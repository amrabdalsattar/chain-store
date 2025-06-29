import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_filter_button.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../data/models/rfq_model.dart';
import '../../logic/cubit/quotation_cubit.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
// Parts
part '../widgets/rfq_card.dart';
part '../widgets/rfq_details_item.dart';
part '../widgets/rfq_stat_card.dart';
part '../widgets/manage_rfq_header_section.dart';
part '../widgets/manage_rfqs_stats_section.dart';
part '../widgets/manage_rfqs_list_section.dart';
part '../widgets/manage_rfqs_list_header.dart';

class ManageRfqsScreen extends StatelessWidget {
  const ManageRfqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<QuotationCubit>().getCustomerRFQs();
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Manage RFQs', style: AppTextStyles.rubikBlackBold20),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 18),
          ),
          onPressed: () => context.pop(),
        ),
        actions: const [CustomFilterButton()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          const ManageRFQHeaderSection(),
          // Stats Section
          const ManageRFQsStatsSection(),
          verticalSpace(20.h),
          // RFQs List Section
          const ManageRfqsListHeader(),
          verticalSpace(12),
          // RFQs List
          const ManageRFQsListSection(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/quotation_model.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/quotation_cubit.dart';

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

class QuotationDetailsScreen extends StatelessWidget {
  final QuotationModel quotation;

  const QuotationDetailsScreen({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();
    cubit.setQuotationId(quotation.id);
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const QuotationDetailsAppBar(status: 'pending'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuotationHeaderCard(quotation: quotation),
            SizedBox(height: 16.h),
            QuotationSectionCard(
              title: 'Product Information',
              icon: Icons.inventory_2,
              iconColor: ColorsHelper.bagIconBackGroundColor,
              children: [
                QuotationDetailRow(
                  icon: Icons.shopping_bag,
                  label: 'Product Name',
                  value: quotation.supplierName,
                  iconColor: ColorsHelper.bagIconBackGroundColor,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.category,
                  label: 'Category',
                  value: quotation.createdAt,
                  iconColor: ColorsHelper.statisticsIconBackGroundColor,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.format_list_numbered,
                  label: 'Requested Quantity',
                  value: '${quotation.quantity} units',
                  iconColor: ColorsHelper.completedOrderBackGroundColor,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            QuotationSectionCard(
              title: 'Pricing Details',
              icon: Icons.payments,
              iconColor: ColorsHelper.dollarIconBackGroundColor,
              children: [
                QuotationDetailRow(
                  icon: Icons.monetization_on,
                  label: 'Unit Price',
                  value: '\$${quotation.unitPrice}',
                  iconColor: ColorsHelper.dollarIconBackGroundColor,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.calculate,
                  label: 'Total Amount',
                  value: '\$${quotation.unitPrice * quotation.quantity}',
                  iconColor: ColorsHelper.gold,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.local_shipping,
                  label: 'Shipping Cost',
                  value: '${quotation.deliveryFee}',
                  iconColor: ColorsHelper.bagIconBackGroundColor,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            QuotationSectionCard(
              title: 'Supplier Information',
              icon: Icons.store,
              iconColor: ColorsHelper.statisticsIconBackGroundColor,
              children: [
                QuotationDetailRow(
                  icon: Icons.business,
                  label: 'Supplier Name',
                  value: quotation.supplierName,
                  iconColor: ColorsHelper.statisticsIconBackGroundColor,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.star,
                  label: 'Rating',
                  value: '4.8 ⭐ (127 reviews)',
                  iconColor: ColorsHelper.gold,
                ),
                SizedBox(height: 12.h),
                const QuotationDetailRow(
                  icon: Icons.location_on,
                  label: 'Location',
                  value: 'Not specified',
                  iconColor: ColorsHelper.rejectedOrderBackGroundColor,
                ),
                SizedBox(height: 12.h),
                const QuotationDetailRow(
                  icon: Icons.phone,
                  label: 'Contact',
                  value: '+1 (555) 123-4567',
                  iconColor: ColorsHelper.bagIconBackGroundColor,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            QuotationSectionCard(
              title: 'Delivery Information',
              icon: Icons.local_shipping,
              iconColor: ColorsHelper.pinnedOrderBackGroundColor,
              children: [
                const QuotationDetailRow(
                  icon: Icons.schedule,
                  label: 'Estimated Delivery',
                  value: '7-10 business days',
                  iconColor: ColorsHelper.pinnedOrderBackGroundColor,
                ),
                SizedBox(height: 12.h),
                const QuotationDetailRow(
                  icon: Icons.inventory,
                  label: 'Stock Availability',
                  value: 'In Stock',
                  iconColor: ColorsHelper.completedOrderBackGroundColor,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            QuotationSectionCard(
              title: 'Quote Timeline',
              icon: Icons.timeline,
              iconColor: ColorsHelper.purple,
              children: [
                QuotationDetailRow(
                  icon: Icons.create,
                  label: 'Quote Submitted',
                  value: '${_getDaysAgo(quotation.createdAt)}',
                  iconColor: ColorsHelper.purple,
                ),
                SizedBox(height: 12.h),
                QuotationDetailRow(
                  icon: Icons.access_time,
                  label: 'Valid Until',
                  value: '${quotation.validUntil}',
                  iconColor: ColorsHelper.rejectedOrderBackGroundColor,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            QuotationActionButtons(
              onAccept: () => _showAcceptDialog(context, quotation.id),
              onDecline: () => _showDeclineDialog(context, quotation.id),
              onContact: () => _showContactOptions(context),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  String _getDaysAgo(String createdAt) {
    try {
      final date = DateTime.tryParse(createdAt);
      if (date == null) return createdAt;
      final now = DateTime.now();
      final diff = now.difference(date).inDays;
      if (diff == 0) return 'Today';
      if (diff == 1) return '1 day ago';
      return '$diff days ago';
    } catch (_) {
      return createdAt;
    }
  }

  void _showAcceptDialog(BuildContext context, int quotationId) {
    showDialog(
      context: context,
      builder: (_) {
        return QuotationAcceptDialog(
          onAccept: () async {
            await context.read<QuotationCubit>().changeQuotationStatus(
              quotationId,
            );

            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _showDeclineDialog(BuildContext context, int quotationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return QuotationDeclineDialog(
          onDecline: () async {
            await context.read<QuotationCubit>().changeQuotationStatus(
              quotationId,
              isReject: true,
            );
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsHelper.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return const QuotationDeatilsBottomSheetWidget();
      },
    );
  }
}

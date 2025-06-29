import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../data/models/quotation_model.dart';
import '../../logic/cubit/quotation_cubit.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/theming/colors_helper.dart';

class RFQQuotationsScreen extends StatelessWidget {
  const RFQQuotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: _buildAppBar(),
      body: BlocBuilder<QuotationCubit, QuotationState>(
        builder: (context, state) {
          final quotations = state.quotations ?? [];

          if (state.isLoading &&
              state.rfqState == RFQState.rfqQuotationsState) {
            return const Center(child: CustomLoadingIndicator());
          }

          if (quotations.isEmpty) {
            return _buildEmptyState();
          }

          return _buildQuotationsList(quotations);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Supplier Quotations', style: AppTextStyles.rubikBlackBold20),
      centerTitle: true,
      backgroundColor: ColorsHelper.white,
      elevation: 0,
      shadowColor: ColorsHelper.boxShadow,
      surfaceTintColor: ColorsHelper.transparent,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: ColorsHelper.liteGray,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.w,
                  color: ColorsHelper.darkGray,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: ColorsHelper.primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.description,
                size: 14.w,
                color: ColorsHelper.primaryColor,
              ),
              SizedBox(width: 4.w),
              Text('RFQ', style: AppTextStyles.rubikPrimaryBold12),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: ColorsHelper.primaryColor.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inbox_outlined,
              size: 64.w,
              color: ColorsHelper.primaryColor.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'No Quotations Available',
            style: AppTextStyles.rubikBlackBold18,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              'Suppliers haven\'t submitted their quotes yet. Check back later for updates.',
              style: AppTextStyles.rubikGrayRegular12,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuotationsList(List quotations) {
    return Column(
      children: [
        // Header with quotation count
        Container(
          margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsHelper.primaryColor.withOpacity(0.1),
                ColorsHelper.primaryColor.withOpacity(0.05),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: ColorsHelper.primaryColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: ColorsHelper.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.format_quote,
                  size: 20.w,
                  color: ColorsHelper.primaryColor,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${quotations.length} ${quotations.length == 1 ? 'Quotation' : 'Quotations'} Received',
                      style: AppTextStyles.rubikBlackBold16,
                    ),
                    Text(
                      'Review and make your selection',
                      style: AppTextStyles.rubikGrayRegular12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Quotations list
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            itemCount: quotations.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder:
                (context, index) =>
                    _buildQuotationCard(context, quotations[index], index),
          ),
        ),
      ],
    );
  }

  Widget _buildQuotationCard(
    BuildContext context,
    dynamic quotation,
    int index,
  ) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.quotationDetailsScreen,
          arguments: {
            'cubit': context.read<QuotationCubit>(),
            'quotation': quotation,
          },
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsHelper.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: ColorsHelper.boxShadow.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: ColorsHelper.borderGray.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Header with gradient
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsHelper.primaryColor.withOpacity(0.05),
                    ColorsHelper.primaryColor.withOpacity(0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: _buildQuotationHeader(quotation, index),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(children: [_buildQuotationDetails(quotation)]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuotationHeader(dynamic quotation, int index) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: ColorsHelper.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.store_outlined,
            size: 20.w,
            color: ColorsHelper.primaryColor,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quotation.supplierName ?? 'Unknown Supplier',
                style: AppTextStyles.rubikBlackBold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(
                    Icons.tag,
                    size: 12.w,
                    color: ColorsHelper.secondaryGray,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Quote #${(index + 1).toString().padLeft(3, '0')}',
                    style: AppTextStyles.rubikGrayRegular12,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _getStatusColor('pending'),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: _getStatusTextColor('pending'),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                'PENDING',
                style: AppTextStyles.rubikBlackMedium14.copyWith(
                  color: _getStatusTextColor('pending'),
                  fontSize: 10.sp,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuotationDetails(QuotationModel quotation) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsHelper.liteGray.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: ColorsHelper.borderGray.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 16.w,
                color: ColorsHelper.primaryColor,
              ),
              SizedBox(width: 8.w),
              Text('Quotation Details', style: AppTextStyles.rubikBlackBold15),
            ],
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(
            Icons.inventory_2_outlined,
            'Product',
            quotation.supplierName,
            ColorsHelper.gold,
          ),
          SizedBox(height: 12.h),
          _buildDetailRow(
            Icons.format_list_numbered_outlined,
            'Quantity',
            '${quotation.unitPrice} units',
            ColorsHelper.green,
          ),
          SizedBox(height: 12.h),
          _buildDetailRow(
            Icons.payments_outlined,
            'Total Price',
            'EGP ${quotation.unitPrice}',
            ColorsHelper.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value,
    Color iconColor,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 16.w, color: iconColor),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Row(
            children: [
              Text('$label: ', style: AppTextStyles.rubikGrayRegular12),
              Expanded(
                child: Text(
                  value,
                  style: AppTextStyles.rubikBlackMedium14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAcceptDialog(BuildContext parentContext, QuotationModel quotation) {
    showDialog(
      context: parentContext,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: BlocProvider.of<QuotationCubit>(parentContext),
          child: BlocConsumer<QuotationCubit, QuotationState>(
            listener: (context, state) {
              if (state.errorMessage != null &&
                  state.errorMessage!.isNotEmpty) {
                ScaffoldMessenger.of(parentContext).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: ColorsHelper.red,
                  ),
                );
              }
              if (state.isSubmitted) {
                Navigator.of(dialogContext).pop(); // Close dialog on success
                ScaffoldMessenger.of(parentContext).showSnackBar(
                  SnackBar(
                    content: Text('Quotation accepted successfully!'),
                    backgroundColor: ColorsHelper.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: ColorsHelper.green,
                      size: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Accept Quotation',
                      style: AppTextStyles.rubikBlackBold16,
                    ),
                  ],
                ),
                content:
                    state.isLoading
                        ? const Center(child: CustomLoadingIndicator())
                        : Text(
                          'Are you sure you want to accept this quotation? This will notify the supplier and proceed with the order.',
                          style: AppTextStyles.rubikBlackRegular14,
                        ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.rubikGrayRegular12,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: state.isLoading ? null : () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsHelper.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Accept',
                      style: AppTextStyles.rubikWhiteBold12,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showDeclineDialog(BuildContext context, dynamic quotation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Row(
            children: [
              Icon(Icons.cancel, color: ColorsHelper.red, size: 24.w),
              SizedBox(width: 8.w),
              Text('Decline Quotation', style: AppTextStyles.rubikBlackBold16),
            ],
          ),
          content: Text(
            'Are you sure you want to decline this quotation? This will notify the supplier of your decision.',
            style: AppTextStyles.rubikBlackRegular14,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: AppTextStyles.rubikGrayRegular12),
            ),
            ElevatedButton(
              onPressed: () {
                // context.read<QuotationCubit>().rejectQuotation(quotation.id);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsHelper.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text('Decline', style: AppTextStyles.rubikWhiteBold12),
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return ColorsHelper.gold.withOpacity(0.15);
      case 'accepted':
        return ColorsHelper.green.withOpacity(0.15);
      case 'rejected':
        return ColorsHelper.red.withOpacity(0.15);
      default:
        return ColorsHelper.liteGray;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return ColorsHelper.gold;
      case 'accepted':
        return ColorsHelper.green;
      case 'rejected':
        return ColorsHelper.red;
      default:
        return ColorsHelper.darkGray;
    }
  }
}

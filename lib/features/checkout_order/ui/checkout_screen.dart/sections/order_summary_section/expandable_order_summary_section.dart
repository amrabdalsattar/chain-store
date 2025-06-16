import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/utils/format_utils.dart';
import '../../../../../cart/data/models/cart_response_model.dart';

import 'widgets/cart_items_list.dart';
import 'widgets/checkout_button_bloc_consumer.dart';
import 'widgets/price_row.dart';

class OrderSummarySection extends StatefulWidget {
  final bool hideProductsSection;
  final CartInfo cartInfo;
  const OrderSummarySection({
    super.key,
    this.hideProductsSection = false,
    required this.cartInfo,
  });

  @override
  State<OrderSummarySection> createState() => _OrderSummarySectionState();
}

class _OrderSummarySectionState extends State<OrderSummarySection>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hideProductsSection
              ? Column(
                children: [
                  Text('Order Summary', style: AppTextStyles.rubikBlackBold18),
                  verticalSpace(16),
                ],
              )
              : CartItemsList(
                hideProductsSection: widget.hideProductsSection,
                cartInfo: widget.cartInfo,
              ),
          verticalSpace(20),
          PriceRow(
            label:
                'Subtotal ( ${widget.cartInfo.items!.length} ${getPluralOrSingular('item', widget.cartInfo.items!.length)} )',
            value: widget.cartInfo.total!,
          ),
          verticalSpace(12),
          const PriceRow(label: 'Shipping', value: 100),
          verticalSpace(16),
          PriceRow(
            label: 'Total',
            value: (widget.cartInfo.total! + 100),
            isTotalPrice: true,
          ),
          verticalSpace(24),
          CheckoutButtonBlocConsumer(totalAmount: widget.cartInfo.total!),
        ],
      ),
    );
  }
}

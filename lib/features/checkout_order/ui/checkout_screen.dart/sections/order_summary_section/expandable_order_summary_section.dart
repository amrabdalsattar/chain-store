import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/utils/format_utils.dart';

import '../../../../../cart/logic/cart_cubit/cart_cubit.dart';
import 'widgets/cart_items_list.dart';
import 'widgets/checkout_button_bloc_consumer.dart';
import 'widgets/price_row.dart';

class OrderSummarySection extends StatefulWidget {
  final bool hideProductsSection;
  final CartCubit cartCubit;
  const OrderSummarySection({
    super.key,
    this.hideProductsSection = false,
    required this.cartCubit,
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
                cartItems: widget.cartCubit.cartItems,
              ),
          verticalSpace(20),
          PriceRow(
            label:
                'Subtotal ( ${widget.cartCubit.cartItems.length} ${getPluralOrSingular('item', widget.cartCubit.cartItems.length)} )',
            value: widget.cartCubit.totalPrice,
          ),
          verticalSpace(12),
          const PriceRow(label: 'Shipping', value: 100),
          verticalSpace(16),
          PriceRow(
            label: 'Total',
            value: (widget.cartCubit.totalPrice + 100),
            isTotalPrice: true,
          ),
          verticalSpace(24),
          CheckoutButtonBlocConsumer(cartCubit: widget.cartCubit),
        ],
      ),
    );
  }
}

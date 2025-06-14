import 'package:flutter/material.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../data/models/cart_response_model.dart';
import '../../../../shared_widgets/expandable_order_summary_header.dart';
import 'order_summary_cart_item.dart';

class CartItemsList extends StatefulWidget {
  final bool hideProductsSection;
  final CartInfo cartInfo;
  const CartItemsList({
    super.key,
    required this.hideProductsSection,
    required this.cartInfo,
  });

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  bool _isProductsExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableOrderSummaryHeader(
          isExpanded: _isProductsExpanded,
          onToggle: () {
            setState(() {
              _isProductsExpanded = !_isProductsExpanded;
            });
          },
        ),
        verticalSpace(20),
        widget.hideProductsSection
            ? const SizedBox()
            : AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child:
                  _isProductsExpanded
                      ? Column(
                        children: [
                          ...widget.cartInfo.items!
                              .map((item) => OrderSummaryCartItem(item: item))
                              .toList(),
                        ],
                      )
                      : const SizedBox.shrink(),
            ),
      ],
    );
  }
}

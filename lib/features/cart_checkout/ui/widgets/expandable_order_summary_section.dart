import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import 'expandable_order_summary_header.dart';

class OrderSummarySection extends StatefulWidget {
  const OrderSummarySection({super.key, this.hideProductsSection = false});
  final bool hideProductsSection;

  @override
  State<OrderSummarySection> createState() => _OrderSummarySectionState();
}

class _OrderSummarySectionState extends State<OrderSummarySection>
    with SingleTickerProviderStateMixin {
  bool _isProductsExpanded = true;

  final List<Map<String, dynamic>> _cartItems = [
    {
      'imageUrl': 'assets/images/product1.png',
      'title': 'Nike Air Zoom Pegasus 38',
      'price': 'EGP 1,200.00',
      'quantity': 1,
    },
    {
      'imageUrl': 'assets/images/product2.png',
      'title': 'Wireless Bluetooth Headphones',
      'price': 'EGP 1,500.00',
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  verticalSpace(16),
                ],
              )
              : Column(
                children: [
                  ExpandableOrderSummaryHeader(
                    isExpanded: _isProductsExpanded,
                    onToggle: () {
                      setState(() {
                        _isProductsExpanded = !_isProductsExpanded;
                      });
                    },
                  ),
                  verticalSpace(16),
                  widget.hideProductsSection
                      ? const SizedBox()
                      : AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            _isProductsExpanded
                                ? Column(
                                  children: [
                                    ..._cartItems
                                        .map((item) => _CartItem(item: item))
                                        .toList(),
                                    verticalSpace(16),
                                    const Divider(color: Color(0xFFD1D1D1)),
                                    verticalSpace(16),
                                  ],
                                )
                                : const SizedBox.shrink(),
                      ),
                ],
              ),
          _buildPriceRow('Subtotal', 'EGP 2,700.00'),
          verticalSpace(12),
          _buildPriceRow('Shipping', 'EGP 100.00'),
          verticalSpace(12),
          const Divider(color: Color(0xFFD1D1D1)),
          verticalSpace(12),
          _buildPriceRow(
            'Total',
            'EGP 2,800.00',
            isBold: true,
            valueColor: ColorsHelper.black,
            valueSize: 18.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
    double? valueSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: valueSize ?? 16.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

class _CartItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const _CartItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorsHelper.homeScaffoldColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomImageWidget(
                imageUrl: item['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['price'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsHelper.primaryColor,
                      ),
                    ),
                    Text(
                      'Qty: ${item['quantity']}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

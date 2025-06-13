import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';

import '../../../core/widgets/custom_button.dart';
import 'widgets/address_section.dart';

import 'widgets/payment_method_section.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(
        title: 'Confirm Order',
        hideBackButton: false,
        isLeadedByLogo: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              // Shipping Address Section
              const AddressSection(),
              verticalSpace(24),

              // Divider
              Container(
                height: 8,
                color: const Color(0xFFF7F7F9),
                width: double.infinity,
              ),
              verticalSpace(24),

              // Payment Method Section
              const PaymentMethodSection(),
              verticalSpace(24),

              // Divider
              Container(
                height: 0.5,
                color: const Color(0xFFD1D1D1),
                width: double.infinity,
              ),
              verticalSpace(24),

              // Order Summary Section
              const PriceSummarySection(),
              verticalSpace(24),

              // Confirm Order Button
              CustomButton(
                title: 'Confirm Order',
                width: double.infinity,
                onTap: () {
                  // Order confirmation logic will be implemented later
                },
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceSummarySection extends StatefulWidget {
  const PriceSummarySection({super.key});

  @override
  State<PriceSummarySection> createState() => _PriceSummarySectionState();
}

class _PriceSummarySectionState extends State<PriceSummarySection> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              IconButton(
                icon: Icon(
                  _isProductsExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 24.sp,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isProductsExpanded = !_isProductsExpanded;
                  });
                },
              ),
            ],
          ),
          verticalSpace(16),
          if (_isProductsExpanded) ...[
            ..._cartItems.map((item) => _CartItem(item: item)).toList(),
            verticalSpace(16),
            const Divider(color: Color(0xFFD1D1D1)),
            verticalSpace(16),
          ],
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
              child: Image.asset(
                item['imageUrl'],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Icon(
                      Icons.image_not_supported_outlined,
                      size: 30.w,
                      color: Colors.grey,
                    ),
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
                    fontFamily: 'Rubik',
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
                        fontFamily: 'Rubik',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsHelper.primaryColor,
                      ),
                    ),
                    Text(
                      'Qty: ${item['quantity']}',
                      style: TextStyle(
                        fontFamily: 'Rubik',
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

import 'package:connect_chain_market/core/helpers/extensions.dart';
import 'package:connect_chain_market/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/slidable_cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for cart items
    final List<Map<String, dynamic>> cartItems = [
      {
        'id': '1',
        'title': 'Wireless Bluetooth Headphones',
        'price': '89.99',
        'quantity': 1,
        'imageUrl': 'assets/images/product_placeholder.png',
      },
      {
        'id': '2',
        'title': 'Smart Watch with Heart Rate Monitor',
        'price': '129.99',
        'quantity': 2,
        'imageUrl': 'assets/images/product_placeholder.png',
      },
      {
        'id': '3',
        'title': 'Portable Power Bank 10000mAh',
        'price': '49.99',
        'quantity': 1,
        'imageUrl': 'assets/images/product_placeholder.png',
      },
    ];    

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(
        title: 'Shopping Cart',
        hideBackButton: true,
        isLeadedByLogo: true,
      ),
      body:
          cartItems.isEmpty
              ? _buildEmptyCart(context)
              : _buildCartContent(context, cartItems),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.w,
            color: ColorsHelper.primaryColor,
          ),
          verticalSpace(16),
          Text('Your cart is empty', style: AppTextStyles.rubikBlackBold20),
          verticalSpace(8),
          Text(
            'Browse our products and add items to your cart',
            style: AppTextStyles.robotoBlackRegular14,
            textAlign: TextAlign.center,
          ),
          verticalSpace(32),
          CustomButton(
            title: 'Start Shopping',
            width: 200.w,
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(
    BuildContext context,
    List<Map<String, dynamic>> cartItems,
  ) {
    return Column(
      children: [
        // Cart items list
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List of cart items with slidable functionality
                ...cartItems.map(
                  (item) => SlidableCartItem(
                    item: item,
                    onDelete: () {
                      // Handle delete action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item['title']} removed from cart'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: _buildSummaryRow('Total(4 item) :', '240,000 EGP'),
        ),
        verticalSpace(16),
        CustomButton(
          onTap: () {
            context.pushNamed(Routes.checkoutScreenRoute);
          },
          title: 'Proceed to Checkout  ',
          width: 342.w,
          radius: 32.r,
        ),
        verticalSpace(40),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.rubikSemiGreyRegular12),
        Text(value, style: AppTextStyles.rubikBlackRegular16),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/cart_response_model.dart';
import '../../../logic/cubit/cart_cubit_cubit.dart';
import 'slidable_cart_item.dart';
import 'summary_row.dart';

class CartContent extends StatelessWidget {
  final CartInfo cartInfo;
  const CartContent({super.key, required this.cartInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cart items list
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List of cart items with slidable functionality
                ...context.read<CartCubit>().cartItems.map(
                  (item) => SlidableCartItem(
                    item: item,
                    onDelete: () {
                      // Handle delete action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${item.productName} removed from cart',
                          ),
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
          child: SummaryRow(cartInfo: cartInfo),
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
}

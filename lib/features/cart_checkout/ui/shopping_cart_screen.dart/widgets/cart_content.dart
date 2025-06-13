import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'slidable_cart_item.dart';
import 'summary_row.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

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
                SlidableCartItem(
                  onDelete: () {
                    // Handle delete action
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SummaryRow(),
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

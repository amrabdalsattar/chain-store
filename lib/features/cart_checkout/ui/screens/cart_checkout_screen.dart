import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/address_section.dart';

import '../widgets/payment_method_section.dart';
import '../widgets/expandable_order_summary_section.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(
        title: 'Confirm Order',
        hideBackButton: true,
        isLeadedByLogo: true,
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
              const OrderSummarySection(),
              verticalSpace(24),

              // Confirm Order Button
              CustomButton(
                title: 'Confirm Order',
                width: double.infinity,
                onTap: () {
                  // Order confirmation logic will be implemented later
                  context.pushNamed(Routes.orderConfirmationRoute);
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

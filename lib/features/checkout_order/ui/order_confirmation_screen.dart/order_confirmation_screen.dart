import '../../../../core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widgets/section_container.dart';
import 'widgets/order_status_header.dart';
import 'widgets/payment_method_info.dart';
import 'widgets/shipping_info_section.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCreditCardPayment =
        ModalRoute.of(context)!.settings.arguments as bool;
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(
        title: 'Order Confirmation',
        hideBackButton: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              const OrderStatusHeader(),

              verticalSpace(24),

              // Shipping Information Section
              const SectionContainer(
                title: 'Shipping Information',
                child: ShippingInfoSection(),
              ),
              verticalSpace(24),

              // Payment Method Section
              SectionContainer(
                title: 'Payment Method',
                child: PaymentMethodInfo(
                  isCreditCardPayment: isCreditCardPayment,
                ),
              ),
              verticalSpace(24),

              // Continue Shopping Button
              CustomButton(
                title: 'Continue Shopping',
                width: double.infinity,
                onTap: () {
                  context.pop();
                },
                color: ColorsHelper.primaryColor,
                radius: 12,
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}

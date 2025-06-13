import 'package:connect_chain_market/core/helpers/extensions.dart';
import 'package:connect_chain_market/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/order_details_section.dart';
import '../widgets/order_status_header.dart';
import '../widgets/payment_method_info.dart';
import '../widgets/expandable_order_summary_section.dart';
import '../widgets/section_container.dart';
import '../widgets/shipping_info_section.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              // Order Details Section
              const SectionContainer(
                title: 'Order Details',
                child: OrderDetailsSection(),
              ),
              verticalSpace(24),

              // Shipping Information Section
              const SectionContainer(
                title: 'Shipping Information',
                child: ShippingInfoSection(),
              ),
              verticalSpace(24),

              // Payment Method Section
              const SectionContainer(
                title: 'Payment Method',
                child: PaymentMethodInfo(),
              ),
              verticalSpace(24),

              // Price Summary Section
              const OrderSummarySection(hideProductsSection: true),
              verticalSpace(32),

              // Continue Shopping Button
              CustomButton(
                title: 'Continue Shopping',
                width: double.infinity,
                onTap: () {
                  context.pushNamed(Routes.categoriesScreenRoute);
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

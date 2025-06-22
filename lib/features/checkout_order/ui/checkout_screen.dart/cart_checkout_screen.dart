import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../../core/widgets/basic_app_bar.dart';
import 'sections/address_section/address_section.dart';

import 'sections/payment_methods_section/payment_method_section.dart';
import 'sections/order_summary_section/expandable_order_summary_section.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = ModalRoute.of(context)!.settings.arguments as CartCubit;
    return Scaffold(
      appBar: const BasicAppBar(title: 'Confirm Order'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address Section
            const AddressSection(),
            const CustomDivider(thickness: 8, color: ColorsHelper.offWhite),
            verticalSpace(8),

            // Payment Method Section
            const PaymentMethodSection(),
            verticalSpace(8),
            const CustomDivider(thickness: 8, color: ColorsHelper.offWhite),
            // Order Summary Section
            OrderSummarySection(cartCubit: cartCubit),
          ],
        ),
      ),
    );
  }
}

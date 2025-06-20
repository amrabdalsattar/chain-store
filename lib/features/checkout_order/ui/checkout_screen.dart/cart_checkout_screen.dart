import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';

import '../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../cart/ui/widgets/cart_app_bar.dart';
import 'sections/address_section/address_section.dart';

import 'sections/payment_methods_section/payment_method_section.dart';
import 'sections/order_summary_section/expandable_order_summary_section.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = ModalRoute.of(context)!.settings.arguments as CartCubit;
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CartAppBar(title: 'Confirm Order'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address Section
            const AddressSection(),
            verticalSpace(8),

            // Payment Method Section
            const PaymentMethodSection(),
            verticalSpace(8),

            // Order Summary Section
            OrderSummarySection(cartCubit: cartCubit),
          ],
        ),
      ),
    );
  }
}

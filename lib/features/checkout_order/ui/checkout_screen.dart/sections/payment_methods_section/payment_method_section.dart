import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import 'widgets/payment_method_item.dart';
import '../../../../logic/cubit/checkout_cubit.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  void _selectPaymentMethod() {
    setState(() {
      context.read<CheckoutCubit>().isCreditCardPayment =
          !context.read<CheckoutCubit>().isCreditCardPayment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Method Title
          Text('Payment Method', style: AppTextStyles.rubikBlackBold16),
          verticalSpace(16),

          // Payment Methods
          PaymentMethodItem(
            iconData: Icons.add_card_sharp,

            title: 'Credit Card',
            isSelected:
                context.read<CheckoutCubit>().isCreditCardPayment == true,
            onTap: () => _selectPaymentMethod(),
          ),
          verticalSpace(12),
          PaymentMethodItem(
            iconData: Icons.monetization_on_outlined,

            title: 'Cash on Delivery',
            isSelected:
                context.read<CheckoutCubit>().isCreditCardPayment == false,
            onTap: () => _selectPaymentMethod(),
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}

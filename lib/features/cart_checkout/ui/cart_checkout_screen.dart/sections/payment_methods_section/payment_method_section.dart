import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../shared_widgets/payment_method_item.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int _selectedPaymentMethod = 1;

  void _selectPaymentMethod(int method) {
    setState(() {
      _selectedPaymentMethod = method;
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
            isSelected: _selectedPaymentMethod == 1,
            onTap: () => _selectPaymentMethod(1),
          ),
          verticalSpace(12),
          PaymentMethodItem(
            iconData: Icons.monetization_on_outlined,

            title: 'Cash on Delivery',
            isSelected: _selectedPaymentMethod == 2,
            onTap: () => _selectPaymentMethod(2),
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}

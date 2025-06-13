import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import 'add_card_bottom_sheet.dart';
import 'payment_method_item.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  String _selectedPaymentMethod = 'Credit Card';

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          // Payment Method Title
          Text(
            'Payment Method',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          verticalSpace(16),

          // Payment Methods
          PaymentMethodItem(
            imageUrl: 'assets/images/credit_card.png',
            title: 'Credit Card',
            isSelected: _selectedPaymentMethod == 'Credit Card',
            onTap: () => _selectPaymentMethod('Credit Card'),
          ),
          verticalSpace(12),
          PaymentMethodItem(
            imageUrl: 'assets/images/cash_on_delivery.png',
            title: 'Cash on Delivery',
            isSelected: _selectedPaymentMethod == 'Cash on Delivery',
            onTap: () => _selectPaymentMethod('Cash on Delivery'),
          ),
          verticalSpace(12),
          PaymentMethodItem(
            imageUrl: 'assets/images/add_card.png',
            title: 'Add a new card',
            isSelected: false,
            onTap: () => _showAddCardBottomSheet(context),
          ),
        ],
      ),
    );
  }
}

void _showAddCardBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: const AddCardBottomSheet(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_helper.dart';

class PaymentMethodInfo extends StatelessWidget {
  final bool isCreditCardPayment;
  const PaymentMethodInfo({super.key, required this.isCreditCardPayment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: ColorsHelper.homeScaffoldColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Icon(
              isCreditCardPayment
                  ? Icons.credit_card
                  : Icons.monetization_on_outlined,
              color: ColorsHelper.primaryColor,
              size: 24.w,
            ),
          ),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isCreditCardPayment ? 'Credit Card' : 'Cash on Delivery',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Visibility(
              visible: isCreditCardPayment,
              child: Text(
                '**** **** **** 4242',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsHelper.secondaryGray,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

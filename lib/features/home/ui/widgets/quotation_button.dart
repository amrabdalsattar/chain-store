import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_helper.dart';

class QuotationButton extends StatelessWidget {
  const QuotationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80.h,
      right: 20.w,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.quotationScreenRoute);
        },
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: ColorsHelper.primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorsHelper.primaryColor.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.request_quote,
                  color: ColorsHelper.white,
                  size: 24.sp,
                ),
                SizedBox(height: 2.h),
                Text(
                  'RFQ',
                  style: TextStyle(
                    color: ColorsHelper.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
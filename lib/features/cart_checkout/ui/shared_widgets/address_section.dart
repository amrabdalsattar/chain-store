import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';


class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

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
          // Shipping Address Title
          Row(
            children: [
              Text(
                'Shipping Address',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          
          // Ship to label
          Text(
            'Ship to',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xA6000000), // rgba(0, 0, 0, 0.65)
            ),
          ),
          verticalSpace(8),
          
          // Address container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD1D1D1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '123 Mahmoud Rashwan Street, Assuit',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16.w,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          verticalSpace(8),
          
          // Use different address option
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              horizontalSpace(8),
              Text(
                'Use different address',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsHelper.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
  
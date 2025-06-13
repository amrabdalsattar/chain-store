import 'package:connect_chain_market/core/helpers/spacing.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeGuideDialog extends StatelessWidget {
  const SizeGuideDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        width: 327.w,
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Size Guide',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsHelper.black,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: ColorsHelper.homeScaffoldColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: ColorsHelper.black,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(24),
            
            // Size chart table
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorsHelper.liteGray),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  // Table header
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: ColorsHelper.homeScaffoldColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildHeaderCell('Size', 1),
                        _buildHeaderCell('Chest (in)', 2),
                        _buildHeaderCell('Waist (in)', 2),
                        _buildHeaderCell('Hips (in)', 2),
                      ],
                    ),
                  ),
                  
                  // Table rows
                  _buildTableRow('XS', '34-36', '28-30', '34-36'),
                  _buildDivider(),
                  _buildTableRow('S', '36-38', '30-32', '36-38'),
                  _buildDivider(),
                  _buildTableRow('M', '38-40', '32-34', '38-40'),
                  _buildDivider(),
                  _buildTableRow('L', '40-42', '34-36', '40-42'),
                  _buildDivider(),
                  _buildTableRow('XL', '42-44', '36-38', '42-44'),
                  _buildDivider(),
                  _buildTableRow('XXL', '44-46', '38-40', '44-46'),
                ],
              ),
            ),
            
            verticalSpace(24),
            
            // How to measure section
            Text(
              'How to Measure',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorsHelper.black,
              ),
            ),
            verticalSpace(8),
            Text(
              'Chest: Measure around the fullest part of your chest, keeping the measuring tape horizontal.',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorsHelper.liteBlue,
                height: 1.5,
              ),
            ),
            verticalSpace(8),
            Text(
              'Waist: Measure around your natural waistline, keeping the tape comfortably loose.',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorsHelper.liteBlue,
                height: 1.5,
              ),
            ),
            verticalSpace(8),
            Text(
              'Hips: Measure around the fullest part of your hips, keeping the tape horizontal.',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorsHelper.liteBlue,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorsHelper.black,
        ),
      ),
    );
  }

  Widget _buildTableRow(String size, String chest, String waist, String hips) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          _buildDataCell(size, 1, isBold: true),
          _buildDataCell(chest, 2),
          _buildDataCell(waist, 2),
          _buildDataCell(hips, 2),
        ],
      ),
    );
  }

  Widget _buildDataCell(String text, int flex, {bool isBold = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 14.sp,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: isBold ? ColorsHelper.black : ColorsHelper.liteBlue,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: ColorsHelper.liteGray,
    );
  }
}
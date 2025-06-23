import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import 'timeline/order_time_line.dart';
import 'products_images_row.dart';

class OrderCard extends StatelessWidget {
  final bool isActive;
  const OrderCard({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsHelper.borderGray, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            title: Text(
              'Order No. 72 522',
              style: AppTextStyles.robotoBlackMedium14,
            ),

            subtitle: Text(
              '1267 EGP .  30 Dec',
              style: AppTextStyles.rubikGrayRegular10,
            ),
            trailing: const FittedBox(
              fit: BoxFit.scaleDown,
              child: ProductsImagesRow(
                urls: [
                  'https://magicstudio.com/blog/content/images/2023/10/ringlight.jpg',
                  'https://www.pngall.com/wp-content/uploads/2018/04/Clothing-PNG-Image-File.png',
                  'https://www.pngall.com/wp-content/uploads/2018/04/Clothing-PNG-Image-File.png',
                  'https://www.pngall.com/wp-content/uploads/2018/04/Clothing-PNG-Image-File.png',
                  'https://www.pngall.com/wp-content/uploads/2018/04/Clothing-PNG-Image-File.png',
                ],
              ),
            ),
          ),
          Visibility(
            visible: isActive,
            child: Container(
              padding: EdgeInsets.only(bottom: 12.r),
              child: const OrderTimeline(currentStatus: 'Shipping'),
            ),
          ),
        ],
      ),
    );
  }
}

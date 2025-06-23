import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/theming/font_weight_helper.dart';

class ProductsImagesRow extends StatelessWidget {
  final List<String> urls;
  const ProductsImagesRow({super.key, required this.urls});

  @override
  Widget build(BuildContext context) {
    final int loopLimit = urls.length > 2 ? 2 : urls.length;
    return Row(
      children: [
        for (int i = 0; i < loopLimit; i++) ...[
          CircleAvatar(
            radius: 13.r,
            backgroundColor: ColorsHelper.white,
            backgroundImage: CachedNetworkImageProvider(urls[i]),
          ),
          horizontalSpace(8),
        ],
        if (urls.length > 2) ...[
          horizontalSpace(8),
          CircleAvatar(
            radius: 13.r,
            backgroundColor: ColorsHelper.liteGray,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '+${urls.length - 2}',
                style: AppTextStyles.robotoGrayRegular15.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

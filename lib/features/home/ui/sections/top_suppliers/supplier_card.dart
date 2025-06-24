import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../../../data/models/suppliers_response_model.dart';
import 'starred_rate.dart';

class SupplierCard extends StatelessWidget {
  final SupplierDataModel supplier;
  const SupplierCard({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.w,
      margin: EdgeInsetsDirectional.only(end: 25.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap:
            () => context.pushNamed(
              Routes.supplierDetailsScreenRoute,
              arguments: supplier,
            ),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: ColorsHelper.homeScaffoldColor,
                child: CachedNetworkImage(
                  imageUrl: supplier.imageUrl!,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget:
                      (_, __, ___) => CachedNetworkImage(
                        imageUrl:
                            'https://www.pngplay.com/wp-content/uploads/2/Happy-Man-Transparent-Background.png',
                      ),
                  width: 145.w,
                  height: 151.h,
                ),
              ),
            ),
            verticalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  supplier.name!,
                  style: AppTextStyles.robotoBlackBold14,
                  maxLines: 1,
                ),
                verticalSpace(2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    supplier.name!,
                    style: AppTextStyles.robotoGrayRegular12,
                  ),
                ),
                verticalSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarredRate(rating: supplier.rating!.toDouble()),
                    Text(
                      'View Supplier',
                      style: AppTextStyles.robotoPrimaryBold10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

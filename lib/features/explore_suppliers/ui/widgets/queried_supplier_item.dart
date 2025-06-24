import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../home/data/models/suppliers_response_model.dart';
import '../../../home/ui/sections/top_suppliers/starred_rate.dart';

class QueriedSupplierItem extends StatelessWidget {
  final SupplierDataModel supplier;
  const QueriedSupplierItem({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,

      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.supplierDetailsScreenRoute,
            arguments: supplier,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
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
                    width: 100.w,
                    height: 100.h,
                  ),
                ),
              ),
            ),
            horizontalSpace(24),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    supplier.name ?? '',
                    style: AppTextStyles.robotoBlackBold14,
                  ),
                  verticalSpace(4),
                  Text(
                    supplier.businessType ?? '',
                    style: AppTextStyles.robotoGrayRegular12,
                  ),
                  verticalSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarredRate(rating: supplier.rating ?? 0),
                      Text(
                        'View Supplier',
                        style: AppTextStyles.robotoPrimaryBold10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

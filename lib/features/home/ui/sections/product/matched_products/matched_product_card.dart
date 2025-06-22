import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/colors_helper.dart';
import '../../../../../../core/utils/format_utils.dart';
import '../../../../../../core/widgets/loading_indicator.dart';

import '../../../../../wishlist/ui/widgets/wishlist_heart_bloc_listener.dart';
import '../../../../data/models/products_response_model.dart';
import 'widgets/rating_stars.dart';
part 'widgets/product_image.dart';

part 'widgets/product_info.dart';

class MatchedProductCard extends StatelessWidget {
  final ProductDataModel product;
  const MatchedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ProductImage(
              imageUrl: product.image ?? '',
              productId: product.productId!,
            ),
          ),
          verticalSpace(4),
          Expanded(
            flex: 2,
            child: ProductInfo(
              productName: product.name ?? '',
              productPrice: product.price ?? 0,
              productRating: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

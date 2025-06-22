import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/saved_product.dart';
import '../../data/models/wishlist_response.dart';
import 'wishlist_heart_bloc_listener.dart';

class WishlistItem extends StatelessWidget {
  final WishlistProductModel wishlistProduct;
  const WishlistItem({super.key, required this.wishlistProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          SavedProduct(
            productImage: wishlistProduct.image ?? '',
            productName: wishlistProduct.name ?? '',
            price: wishlistProduct.price ?? 0,
            minimumOrder: wishlistProduct.stock ?? 0,
            isCartItem: false,
          ),
          Positioned.directional(
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: WishlistHeartBlocListener(
                productId: wishlistProduct.productId,
              ),
            ),
            textDirection: TextDirection.ltr,
            end: 0,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../data/models/wishlist_response.dart';
import 'wishlist_item.dart';

class WishlistItemsListView extends StatelessWidget {
  final List<WishlistProductModel> wishlistProducts;
  const WishlistItemsListView({super.key, required this.wishlistProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wishlistProducts.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) =>
              WishlistItem(wishlistProduct: wishlistProducts[index]),
    );
  }
}

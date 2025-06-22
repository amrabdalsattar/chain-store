import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/basic_app_bar.dart';

import 'widgets/wishlist_bloc_builder.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Wishlist',
        actionWidget: IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
          iconSize: 22.r,
        ),
      ),
      body: const WishlistBlocBuilder(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../data/models/cart_response_model.dart';
import 'shopping_cart_item.dart';

class SlidableCartItem extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onDelete;

  const SlidableCartItem({
    super.key,
    required this.onDelete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Slidable(
        key: ValueKey(item.productId),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          dismissible: DismissiblePane(onDismissed: onDelete),
          extentRatio: 0.3,

          children: [
            SlidableAction(
              onPressed: (_) => onDelete(),
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: Icons.delete,

              borderRadius: BorderRadius.circular(8.r),
            ),
          ],
        ),
        child: ShoppingCartItem(item: item),
      ),
    );
  }
}

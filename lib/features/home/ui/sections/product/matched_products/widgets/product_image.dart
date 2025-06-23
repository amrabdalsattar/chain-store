part of '../matched_product_card.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final int productId;

  final bool hasConstrains;
  const ProductImage({
    super.key,
    required this.imageUrl,

    this.hasConstrains = false,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: hasConstrains ? StackFit.loose : StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsHelper.homeScaffoldColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget:
                  (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
              width: hasConstrains ? 100.w : null,
              height: hasConstrains ? 100.h : null,
            ),
          ),
        ),
        Positioned.directional(
          child: SizedBox(
            width: 40.w,
            height: 40.h,
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: WishlistHeartBlocListener(productId: productId),
            ),
          ),
          textDirection: TextDirection.ltr,
          top: 0,
          end: 0,
        ),
      ],
    );
  }
}

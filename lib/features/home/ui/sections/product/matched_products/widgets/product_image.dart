part of '../matched_product_card.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final bool isInWishlist;
  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.isInWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsHelper.homeScaffoldColor,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (_, __) => const LoadingIndicator(),
            errorWidget:
                (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
          ),
        ),
        Positioned.directional(
          child: SizedBox(
            width: 37.w,
            height: 37.h,
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(
                isInWishlist
                    ? AppImages.selectedHeart
                    : AppImages.unselectedHeart,
                colorFilter: const ColorFilter.mode(
                  ColorsHelper.redAccent,
                  BlendMode.srcIn,
                ),
              ),
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

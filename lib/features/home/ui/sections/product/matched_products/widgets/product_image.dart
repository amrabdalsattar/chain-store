part of '../matched_product_card.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final bool isInWishlist;
  final bool hasConstrains;
  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.isInWishlist,
    this.hasConstrains = false,
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

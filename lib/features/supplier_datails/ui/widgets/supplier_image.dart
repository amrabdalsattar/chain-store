part of '../supplier_details_screen.dart';

class SupplierImage extends StatelessWidget {
  final String imageUrl;
  const SupplierImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsHelper.fadedBlack,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (_, __) => const LoadingIndicator(),
          errorWidget:
              (_, __, ___) => CachedNetworkImage(
                imageUrl:
                    'https://www.pngplay.com/wp-content/uploads/2/Happy-Man-Transparent-Background.png',
                fit: BoxFit.cover,
              ),
          height: 150.h,
          width: 150.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

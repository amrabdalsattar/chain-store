part of '../product_card.dart';

class ProductInfo extends StatelessWidget {
  final String productName;
  final double productPrice;
  final double productRating;
  const ProductInfo({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productRating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$productName',
          style: AppTextStyles.robotoBlackRegular12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(6),
        RatingStars(rating: productRating, showEmptyStars: false),
        verticalSpace(6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${priceFormat(productPrice)} EGP',
                  style: AppTextStyles.robotoBlackBold14,
                ),
                TextSpan(
                  text: ' each, > 5pcs',
                  style: AppTextStyles.robotoBlackRegular12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

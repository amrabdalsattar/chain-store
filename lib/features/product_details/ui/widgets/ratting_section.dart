part of '../product_details_screen.dart';


class RattingSection extends StatelessWidget {
  const RattingSection({super.key, required this.product});

  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            product.averageRating.toStringAsFixed(1),
            style: AppTextStyles.rubikBlackBold15,
          ),
          verticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color:
                    index < product.averageRating.round()
                        ? Colors.amber
                        : Colors.grey[300],
                size: 28,
              ),
            ),
          ),
          verticalSpace(4),
          Text(
            '${product.totalRatings} Rating & ${product.reviews.length} Reviews',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorsHelper.secondaryGray,
            ),
          ),
        ],
      ),
    );
  }
}
  
part of '../product_details_screen.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({super.key, required this.product});

  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            color: ColorsHelper.homeScaffoldColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            '${product.categoryName}',
            style: AppTextStyles.robotoBlackBold10,
          ),
        ),

        // Price and Sale Badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product.name,
                    style: AppTextStyles.rubikBlackBold20,
                  ),
                  verticalSpace(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${product.price} EGP',
                          style: AppTextStyles.robotoBlackBold20,
                        ),
                      ),
                      Text(
                        '  each, > 5 pcs',
                        style: AppTextStyles.robotoBlackRegular12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(20),
            // Sale Badge
            ProductStatusSection(
              isInStock: product.isStockAvailable,
              isLowStock: product.stock <= product.minimumStock,
            ),
          ],
        ),
      ],
    );
  }
}

class ProductStatusSection extends StatelessWidget {
  const ProductStatusSection({
    super.key,
    required this.isInStock,
    this.isLowStock = false,
  });
  final bool isInStock;
  final bool isLowStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color:
            isInStock
                ? ColorsHelper.primaryColor.withValues(alpha: 0.15)
                : ColorsHelper.rejectedOrderBackGroundColor.withValues(
                  alpha: 0.18,
                ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_offer_outlined,
            color:
                isInStock
                    ? ColorsHelper.primaryColor
                    : ColorsHelper.rejectedOrderBackGroundColor,
            size: 16.r,
          ),
          horizontalSpace(8),
          Text(
            isInStock
                ? 'on sale'
                : (isLowStock == true ? 'Low Stock' : 'out of stock'),
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color:
                  isInStock
                      ? ColorsHelper.primaryColor
                      : ColorsHelper.rejectedOrderBackGroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

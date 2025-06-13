import 'package:connect_chain_market/core/helpers/spacing.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:connect_chain_market/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final String imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCartTap;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCartTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorsHelper.white,
          boxShadow: [
            BoxShadow(
              color: ColorsHelper.boxShadow.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate responsive height for image based on available width
            final imageHeight = (constraints.maxWidth * 0.7).clamp(80.0, 160.0);
            final cardMaxHeight = (constraints.maxHeight > 0
                    ? constraints.maxHeight
                    : 260.0)
                .clamp(180.0, 340.0);
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: cardMaxHeight,
                minHeight: 180.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image with favorite button
                  Flexible(
                    flex: 5,
                    child: Stack(
                      children: [
                        // Product image container
                        Container(
                          height: imageHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: ColorsHelper.homeScaffoldColor,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),

                            child: CustomImageWidget(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover ,
                            ),
                          ),
                        ),
                        // Favorite button
                        Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: GestureDetector(
                            onTap: onFavoriteTap,
                            child: Container(
                              padding: EdgeInsets.all(6.r),
                              decoration: BoxDecoration(
                                color: ColorsHelper.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorsHelper.boxShadow.withOpacity(
                                      0.1,
                                    ),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    isFavorite
                                        ? Colors.red
                                        : Colors.red.withOpacity(0.7),
                                size: 16.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(8),
                  // Product details
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Product title
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsHelper.black,
                              letterSpacing: -0.24,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6.h),
                          // Rating stars
                          Row(
                            children: [
                              Text(
                                rating.toString(),
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsHelper.black,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      index < rating.floor()
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 12.r,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(2),
                          // Price and Add to Cart
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                price,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsHelper.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              GestureDetector(
                                onTap: onAddToCartTap,
                                child: Container(
                                  padding: EdgeInsets.all(3.r),
                                  decoration: BoxDecoration(
                                    color: ColorsHelper.primaryColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: ColorsHelper.white,
                                    size: 16.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

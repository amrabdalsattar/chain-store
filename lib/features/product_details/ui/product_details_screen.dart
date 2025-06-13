import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../data/models/product_model.dart';
import '../logic/cubit/product_details_cubit.dart';
import 'widgets/color_selector.dart';
import 'widgets/expandable_description.dart';
import 'widgets/product_image_carousel.dart';
import 'widgets/quantity_selector.dart';
import 'widgets/rating_stars.dart';
import 'widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: _ProductDetailsContent(product: product),
    );
  }
}

class _ProductDetailsContent extends StatelessWidget {
  final ProductModel product;

  const _ProductDetailsContent({required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();

    return Scaffold(
      backgroundColor: ColorsHelper.white,
      appBar: AppBar(
        backgroundColor: ColorsHelper.homeScaffoldColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsHelper.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: ColorsHelper.black),
            onPressed: () {
              context.pushNamed(Routes.rattingScreenRoute);
            },
          ),
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: ColorsHelper.black,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Added to wishlist'),
                      backgroundColor: ColorsHelper.primaryColor,
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image Carousel
            ProductImageCarousel(images: product.images),

            // Product Details Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),

                  // Brand
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsHelper.homeScaffoldColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Cotton Club',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsHelper.black,
                      ),
                    ),
                  ),
                  verticalSpace(16),
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
                            horizontalSpace(12),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              '${product.price} EGP',
                              style: AppTextStyles.rubikBlackBold20,
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(20),
                      // Sale Badge
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: ColorsHelper.primaryColor.withValues(
                            alpha: 0.15,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: ColorsHelper.primaryColor,
                              size: 16.r,
                            ),
                            horizontalSpace(8),
                            Text(
                              'on sale',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorsHelper.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  verticalSpace(16),
                  // Sizes
                  Text('Sizes', style: AppTextStyles.rubikBlackBold13),
                  verticalSpace(8),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      return SizeSelector(
                        sizes: product.sizes,
                        selectedSize: cubit.selectedSize,
                        onSizeSelected: cubit.selectSize,
                      );
                    },
                  ),
                  verticalSpace(16),
                  // Colors
                  Text('Colors', style: AppTextStyles.rubikBlackBold13),
                  verticalSpace(8),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      return ColorSelector(
                        colors: product.colors,
                        selectedColorIndex: cubit.selectedColorIndex,
                        onColorSelected: cubit.selectColor,
                      );
                    },
                  ),
                  verticalSpace(16),
                  // Quantity
                  Row(
                    children: [
                      Text('Quantity :', style: AppTextStyles.rubikBlackBold15),
                      horizontalSpace(16),
                      // Quantity Selector
                      BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                        builder: (context, state) {
                          return QuantitySelector(
                            quantity: cubit.quantity,
                            onIncrease: cubit.increaseQuantity,
                            onDecrease: cubit.decreaseQuantity,
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  // Product Description Title
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsHelper.black,
                    ),
                  ),
                  verticalSpace(8),
                  // Expandable Description
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final maxLines = 3;
                      final isLong = product.description.length > 80;
                      return ExpandableDescription(
                        description: product.description,
                        isLong: isLong,
                        maxLines: maxLines,
                      );
                    },
                  ),
                  verticalSpace(20),
                  // Rating and Reviews
                  Center(
                    child: Column(
                      children: [
                        Text(
                          product.rating.toStringAsFixed(1),
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
                                  index < product.rating.round()
                                      ? Colors.amber
                                      : Colors.grey[300],
                              size: 28,
                            ),
                          ),
                        ),
                        verticalSpace(4),
                        Text(
                          '${product.reviewCount} Rating & ${product.reviewCount} Reviews',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsHelper.secondaryGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                ],
              ),
            ),
            // Comment Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 336.w,
                    padding: EdgeInsets.only(
                      left: 48.w,
                      right: 16.w,
                      top: 16.h,
                      bottom: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsHelper.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tasneem Wael',
                                    style: AppTextStyles.robotoBlackMedium15,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '4.0',
                                      style: AppTextStyles.robotoBlackMedium15,
                                    ),
                                    horizontalSpace(4),
                                    const RatingStars(rating: 4, size: 16),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(8),
                        Text(
                          'I wasn’t expecting much, but wow—this T-shirt is next-level comfy! The fabric feels super soft on the skin, and the fit is just right—not too tight, not too loose.',
                          style: AppTextStyles.robotoFadedBlackRegular16
                              .copyWith(fontSize: 14.sp),
                        ),
                        verticalSpace(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up_alt_outlined,
                              size: 22,
                              color: ColorsHelper.black,
                            ),
                            horizontalSpace(8),
                            const Icon(
                              Icons.thumb_down_alt_outlined,
                              size: 22,
                              color: ColorsHelper.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -25,
                    left: -5,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsHelper.liteGray,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            Container(
              padding: EdgeInsets.only(right: 20.w),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.pushNamed(Routes.rattingScreenRoute);
                },
                child: Text(
                  'See All Reviews',
                  style: AppTextStyles.robotoBlackBold12.copyWith(
                    color: ColorsHelper.fadedBlack,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: ColorsHelper.white,
          border: const Border(
            top: BorderSide(color: ColorsHelper.borderGray, width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                title: 'Buy Now',
                width: double.infinity,
                color: ColorsHelper.primaryColor,
                radius: 32.r,
                textStyle: TextStyle(
                  color: ColorsHelper.white,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                onTap: () {
                  // Buy now logic
                },
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: CustomButton(
                title: 'Add To Cart',
                width: double.infinity,
                radius: 32.r,
                color: ColorsHelper.white,
                textStyle: TextStyle(
                  color: ColorsHelper.black,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                borderColor: ColorsHelper.borderGray,
                onTap: () {
                  // Add to cart logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

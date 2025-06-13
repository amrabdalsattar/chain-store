import 'package:connect_chain_market/core/helpers/app_images.dart';
import 'package:connect_chain_market/core/helpers/spacing.dart';
import 'package:connect_chain_market/core/routing/routes.dart';
import 'package:connect_chain_market/core/theming/app_text_styles.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:connect_chain_market/core/widgets/custom_app_bar.dart';
import 'package:connect_chain_market/features/categories/data/models/category_model.dart';
import 'package:connect_chain_market/features/categories/ui/widgets/category_item.dart';
import 'package:connect_chain_market/features/categories/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: CustomAppBar(title: 'Categories', hideBackButton: true),
      body: SafeArea(
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Categories list
                      _buildCategoriesSidebar(context),

                      // Right side - Content area
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  constraints.maxWidth < 600 ? 12.w : 24.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(24),
                                // Recommendations section
                                _buildSectionTitle('Recommendations'),
                                verticalSpace(12),
                                _buildProductGrid(),
                                verticalSpace(24),
                                // For you section
                                _buildSectionTitle('For you'),
                                verticalSpace(12),
                                _buildProductGrid(),
                                verticalSpace(24),
                                // Get product inspiration section
                                _buildSectionTitle('Get product inspiration'),
                                verticalSpace(12),
                                _buildCategoryCircles(),
                                verticalSpace(32),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.robotoBlackSemiBold16),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'See all',
                  style: AppTextStyles.rubikGrayRegular12.copyWith(
                    color: ColorsHelper.primaryColor,
                  ),
                ),
                horizontalSpace(4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.r,
                  color: ColorsHelper.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSidebar(BuildContext context) {
    final categories = [
      'Featured',
      'Deals',
      'Consumer Electronics',
      'Jewelry, Eyewear & Watches',
      'Apparel & Accessories',
      'Packaging & Printing',
      'Sports & Entertainment',
      'Home & Garden',
      'Beauty',
      'Men`s clothing',
      'Women`s Clothing',
      'Home Improvement',
      'MRO',
      'Vehicle Parts & Accessories',
    ];

    // Calculate responsive width based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = screenWidth < 600 ? screenWidth * 0.3 : 180.w;

    return Container(
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        boxShadow: [
          BoxShadow(
            color: ColorsHelper.boxShadow.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories title
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h, bottom: 16.h),
            child: Text(
              'For you',
              style: AppTextStyles.robotoBlackRegular14.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ),

          // Categories list
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 8.h),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == 0;
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? ColorsHelper.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color:
                              isSelected
                                  ? ColorsHelper.primaryColor
                                  : Colors.transparent,
                          width: 3.w,
                        ),
                      ),
                    ),
                    child: Text(
                      category,
                      style: AppTextStyles.rubikGrayMedium12.copyWith(
                        color:
                            isSelected
                                ? ColorsHelper.primaryColor
                                : ColorsHelper.black,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    // Sample product data
    final products = [
      {
        'title': 'Wireless Bluetooth Headphones',
        'price': '\$49.99',
        'rating': 4.5,
        'imageUrl': 'https://example.com/headphones.jpg',
      },
      {
        'title': 'Smart Watch with Heart Rate Monitor',
        'price': '\$89.99',
        'rating': 4.2,
        'imageUrl': 'https://example.com/smartwatch.jpg',
      },
      {
        'title': 'Portable Bluetooth Speaker',
        'price': '\$39.99',
        'rating': 4.7,
        'imageUrl': 'https://example.com/speaker.jpg',
      },
      {
        'title': 'Wireless Charging Pad',
        'price': '\$29.99',
        'rating': 4.0,
        'imageUrl': 'https://example.com/charger.jpg',
      },
    ];

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the number of columns based on available width
          // For smaller screens, use 2 columns, for larger screens use 3
          final screenWidth = MediaQuery.of(context).size.width;
          final sidebarWidth = 180.w;
          final availableWidth =
              screenWidth - sidebarWidth - 48.w; // Account for padding

          // Determine crossAxisCount based on available width
          int crossAxisCount = 2; // Default for smaller screens
          if (availableWidth > 600) {
            crossAxisCount = 3; // For larger screens
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.65, // Adjusted for better proportions
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to product details
                  Navigator.pushNamed(context, Routes.productDetailsRoute);
                },
                child: ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as String,
                  rating: product['rating'] as double,
                  imageUrl: product['imageUrl'] as String,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryCircles() {
    final categories = [
      CategoryModel(
        name: 'Electronics',
        iconPath: AppImages.electronicsIcon,
        imageUrl: 'https://example.com/electronics.jpg',
      ),
      CategoryModel(name: 'Fashion', iconPath: AppImages.sportsIcon),
      CategoryModel(name: 'Home & Garden', iconPath: AppImages.sportsIcon),
      CategoryModel(name: 'Beauty', iconPath: AppImages.sportsIcon),
      CategoryModel(name: 'Sports', iconPath: AppImages.sportsIcon),
      CategoryModel(name: 'Toys & Games', iconPath: AppImages.electronicsIcon),
      CategoryModel(name: 'Automotive', iconPath: AppImages.electronicsIcon),
    ];

    return Container(
      height: 120.h,
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        itemExtent: 100.w,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CategoryItem(
              category: category,
              onTap: () {
                // Navigate to category details
                Navigator.pushNamed(
                  context,
                  Routes.productDetailsRoute,
                  arguments: category,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

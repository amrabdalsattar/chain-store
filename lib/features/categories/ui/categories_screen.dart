import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../data/models/category_model.dart';
import 'widgets/category_circles.dart';
import 'widgets/category_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/products_grid.dart';
import 'widgets/section_tile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(title: 'Categories', hideBackButton: true),
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
                      CategorySideBar(categories: categories),

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
                                const SectionTile(title: 'Recommendations'),
                                verticalSpace(12),
                                CategoryProductsGrid(products: products),
                                verticalSpace(24),
                                // For you section
                                const SectionTile(title: 'For you'),
                                verticalSpace(12),
                                CategoryProductsGrid(products: products),
                                verticalSpace(24),
                                // Get product inspiration section
                                const SectionTile(
                                  title: 'Get product inspiration',
                                ),
                                verticalSpace(12),
                                CategoryCircles(categories: categoryCircles),
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
}

final categoryCircles = [
  const CategoryModel(
    name: 'Electronics',
    iconPath: AppImages.electronicsIcon,
    imageUrl: 'https://example.com/electronics.jpg',
  ),
  const CategoryModel(name: 'Fashion', iconPath: AppImages.sportsIcon),
  const CategoryModel(name: 'Home & Garden', iconPath: AppImages.sportsIcon),
  const CategoryModel(name: 'Beauty', iconPath: AppImages.sportsIcon),
  const CategoryModel(name: 'Sports', iconPath: AppImages.sportsIcon),
  const CategoryModel(
    name: 'Toys & Games',
    iconPath: AppImages.electronicsIcon,
  ),
  const CategoryModel(name: 'Automotive', iconPath: AppImages.electronicsIcon),
];

final categories = [
  'Featured',
  'Deals',
  'Consumer Electronics',
  'Jewelry, EyeWear & Watches',
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

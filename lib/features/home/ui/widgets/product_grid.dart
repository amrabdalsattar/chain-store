import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../categories/ui/widgets/product_card.dart';
import '../../../product_details/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onProductTap;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return _buildProductGrid();
  }
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
            childAspectRatio: 0.75, // Adjusted for better proportions
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Navigate to product details
                context.pushNamed(
                  Routes.productDetailsRoute,
                  arguments: product[index],
                );
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsGrid extends StatelessWidget {
  final List products;
  const CategoryProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
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
              return GestureDetector();
            },
          );
        },
      ),
    );
  }
}

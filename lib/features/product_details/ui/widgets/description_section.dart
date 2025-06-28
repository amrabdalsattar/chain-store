part of '../product_details_screen.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.product});

  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Description', style: AppTextStyles.rubikBlackBold14),
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
      ],
    );
  }
}

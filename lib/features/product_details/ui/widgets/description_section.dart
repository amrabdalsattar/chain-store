part of '../product_details_screen.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.product});

  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}

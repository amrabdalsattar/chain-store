part of '../product_details_screen.dart';

class SizeSelectorSection extends StatelessWidget {
  const SizeSelectorSection({super.key, required this.cubit});

  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sizes', style: AppTextStyles.rubikBlackBold13),
        verticalSpace(8),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            // Dummy Data
            return SizeSelector(
              sizes: const ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'],
              selectedSize: cubit.selectedSize,
              onSizeSelected: cubit.selectSize,
            );
          },
        ),
      ],
    );
  }
}

part of '../product_details_screen.dart';


class ColorSelectorSection extends StatelessWidget {
  const ColorSelectorSection({
    super.key,
    required this.cubit,
  });

  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Colors', style: AppTextStyles.rubikBlackBold13),
        verticalSpace(8),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            // Dummy Data
            return ColorSelector(
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple,
              ],
              selectedColorIndex: cubit.selectedColorIndex,
              onColorSelected: cubit.selectColor,
            );
          },
        ),
      ],
    );
  }
}

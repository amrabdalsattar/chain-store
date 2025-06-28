part of '../product_details_screen.dart';

class QuantitySelectorSection extends StatelessWidget {
  const QuantitySelectorSection({super.key, required this.cubit});

  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Quantity :', style: AppTextStyles.rubikBlackBold14),
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
    );
  }
}

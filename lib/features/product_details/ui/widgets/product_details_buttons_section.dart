part of '../product_details_screen.dart';

class ProductDetailsButtonsSection extends StatelessWidget {
  const ProductDetailsButtonsSection({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    final ProductDetailsCubit productDetailsCubit =
        context.read<ProductDetailsCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 80.h,
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        border: const Border(
          top: BorderSide(color: ColorsHelper.homeScaffoldColor, width: 1),
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
              borderColor: ColorsHelper.transparent,
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
              height: 41.h,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: CartButton(
              productId: productId,
              quantity: productDetailsCubit.quantity,
            ),
          ),
        ],
      ),
    );
  }
}

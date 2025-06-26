part of '../product_details_screen.dart';

class ProductDetailsButtonsSection extends StatelessWidget {
  const ProductDetailsButtonsSection({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        border: const Border(
          top: BorderSide(color: ColorsHelper.borderGray, width: 1),
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
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is ItemAddedToCartState) {
                  DialogsHelper.showBasicToast(
                    'Item added to cart successfully!',
                  );
                } else if (state is ErrorCartState) {
                  DialogsHelper.showBasicToast(
                    state.apiErrorModel.message ?? 'Unkown Error',
                  );
                }
              },
              builder: (context, state) {
                final bool isLoading = state is AddingItemToCartState;
                return CustomButton(
                  isLoading: isLoading,
                  title: 'Add To Cart',
                  width: double.infinity,
                  radius: 32.r,
                  color: ColorsHelper.white,
                  textStyle: TextStyle(
                    color: ColorsHelper.black,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  borderColor: ColorsHelper.borderGray,
                  onTap: () {
                    context.read<CartCubit>().addToCart(productId, 1);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

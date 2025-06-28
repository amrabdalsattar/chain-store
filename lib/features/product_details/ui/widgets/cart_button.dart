part of '../product_details_screen.dart';

class CartButton extends StatelessWidget {
  final int productId;
  final int quantity;
  const CartButton({
    super.key,
    required this.productId,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is ItemAddedToCartState) {
          DialogsHelper.showBasicToast('Item added to cart successfully!');
        } else if (state is ErrorCartState) {
          DialogsHelper.showBasicToast(
            state.apiErrorModel.message ?? 'Unknown Error',
          );
        } else if (state is ItemRemovedFromCartState) {
          DialogsHelper.showBasicToast('Item removed from cart successfully!');
        }
      },
      builder: (context, state) {
        final bool isLoading =
            state is AddingItemToCartState ||
            state is RemovingItemFromCartState;
        final bool isInCart = context.read<CartCubit>().isInCart(productId);
        return CustomButton(
          isLoading: isLoading,
          loadingIndicatorColor: ColorsHelper.primaryColor,
          title: isInCart ? 'Remove' : 'Add To Cart',
          hasWidget: isInCart ? true : false,
          widget:
              isInCart
                  ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: ColorsHelper.redAccent,
                      size: 20,
                    ),
                  )
                  : null,
          width: double.infinity,
          radius: 32.r,
          color: ColorsHelper.white,
          textStyle: AppTextStyles.rubikBlackBold16.copyWith(
            color: isInCart ? ColorsHelper.redAccent : ColorsHelper.black,
          ),
          borderColor: ColorsHelper.borderGray,
          height: 41.h,
          onTap: () {
            if (isInCart) {
              context.read<CartCubit>().removeFromCart(productId);
              return;
            } else {
              context.read<CartCubit>().addToCart(productId, quantity);
            }
          },
        );
      },
    );
  }
}

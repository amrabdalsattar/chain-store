import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/imaged_error.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cart_cubit/cart_cubit.dart';
import '../../logic/cart_cubit/cart_state.dart';
import 'cart_content.dart';
import 'empty_cart.dart';

class CartBlocBuilder extends StatelessWidget {
  const CartBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = context.read<CartCubit>();
    cartCubit.cartItems.isEmpty ? cartCubit.getCartInfo() : null;
    return BlocBuilder<CartCubit, CartState>(
      buildWhen:
          (previous, current) =>
              current is LoadingCartInfoState ||
              current is LoadedCartInfoState ||
              current is EmptyCartState ||
              current is ItemQuantityChangedState ||
              current is ErrorCartState,
      builder: (context, state) {
        switch (state) {
          case LoadingCartInfoState():
            return const LoadingIndicator();
          case LoadedCartInfoState():
            return CartContent(cartInfo: state.cartInfo);
          case EmptyCartState():
            return const EmptyCart();
          case ErrorCartState():
            return Center(
              child: ImagedError(errorMessage: state.apiErrorModel.message!),
            );
          default:
            return const Center(child: Text('Unknown Error'));
        }
      },
    );
  }
}

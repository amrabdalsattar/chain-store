import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/helpers/dialogs_helper.dart';
import '../../logic/cubit/wishlist_cubit.dart';
import 'wishlist_heart.dart';

class WishlistHeartBlocListener extends StatelessWidget {
  final int productId;
  const WishlistHeartBlocListener({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final WishlistCubit wishlistCubit = context.read<WishlistCubit>();
    return BlocConsumer<WishlistCubit, WishlistState>(
      bloc: wishlistCubit,

      listenWhen:
          (previous, current) =>
              (current is AddingToWishlistErrorState &&
                  current.productId == productId) ||
              (current is RemovingFromWishlistErrorState &&
                  current.productId == productId) ||
              (current is AddedToWishlistState &&
                  current.productId == productId) ||
              (current is RemovedFromWishlistState &&
                  current.productId == productId),
      listener: (context, state) {
        if (state is AddingToWishlistErrorState ||
            state is RemovingFromWishlistErrorState) {
          DialogsHelper.showToastificationMessage(
            context: context,
            title: 'Error',
            description: 'Failed to update wishlist',
            type: ToastificationType.error,
            alignment: Alignment.topCenter,
          );
        } else if (state is AddedToWishlistState) {
          DialogsHelper.showBasicToast('Added to wishlist');
        } else if (state is RemovedFromWishlistState) {
          DialogsHelper.showBasicToast('Removed from wishlist');
        } else {
          return;
        }
      },
      buildWhen:
          (previous, current) =>
              current is WishlistLoadedState ||
              current is WishlistEmptyState ||
              current is AddingToWishlistErrorState ||
              current is RemovingFromWishlistErrorState ||
              (current is AddingToWishlistState &&
                  current.productId == productId) ||
              (current is RemovingFromWishlistState &&
                  current.productId == productId),
      builder: (_, state) {
        final isInWishlist = wishlistCubit.isProductInWishlist(productId);
        final isLoading =
            state is AddingToWishlistState ||
            state is RemovingFromWishlistState;
        return GestureDetector(
          onTap: () {
            if (isLoading) return;
            if (isInWishlist) {
              wishlistCubit.removeFromWishlist(productId);
            } else {
              wishlistCubit.addToWishlist(productId);
            }
          },
          child: WishlistHeart(
            key: Key('wishlist_heart_$productId'),
            isInWishlist: isInWishlist,
            isLoading: isLoading,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/wishlist_cubit.dart';
import 'wishlist_items_list_view.dart';

class WishlistBlocBuilder extends StatelessWidget {
  const WishlistBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      bloc: context.read<WishlistCubit>(),
      buildWhen:
          (previous, current) =>
              current is WishlistLoadingState ||
              current is WishlistLoadedState ||
              current is WishlistEmptyState ||
              current is WishlistErrorState,
      builder: (context, state) {
        switch (state) {
          case WishlistLoadingState():
            return const LoadingIndicator();
          case WishlistLoadedState():
            return WishlistItemsListView(
              wishlistProducts: state.wishlistProducts,
            );
          case WishlistEmptyState():
            return _buildText('Your wishlist is empty');
          case WishlistErrorState():
            return Center(
              child: _buildText(
                state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
              ),
            );
          default:
            return _buildText('Unknown Error');
        }
      },
    );
  }

  Widget _buildText(String message) {
    return Center(child: Text(message, style: AppTextStyles.robotoBlackBold14));
  }
}

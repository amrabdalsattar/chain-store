part of 'wishlist_cubit.dart';

sealed class WishlistState {
  const WishlistState();
}

class WishlistLoadingState extends WishlistState {
  const WishlistLoadingState();
}

// Wishlist Fetching States
class WishlistLoadedState extends WishlistState {
  final List<WishlistProductModel> wishlistProducts;
  const WishlistLoadedState(this.wishlistProducts);
}

class WishlistErrorState extends WishlistState {
  final ApiErrorModel apiErrorModel;
  const WishlistErrorState(this.apiErrorModel);
}

class WishlistEmptyState extends WishlistState {
  const WishlistEmptyState();
}

// Wishlist Adding States

class AddingToWishlistState extends WishlistState {
  final int productId;
  const AddingToWishlistState(this.productId);
}

class AddedToWishlistState extends WishlistState {
  const AddedToWishlistState();
}

class AddingToWishlistErrorState extends WishlistState {
  final ApiErrorModel apiErrorModel;
  final int productId;
  const AddingToWishlistErrorState(this.apiErrorModel, this.productId);
}

// Wishlist Removal States

class RemovingFromWishlistState extends WishlistState {
  final int productId;
  const RemovingFromWishlistState(this.productId);
}

class RemovedFromWishlistState extends WishlistState {
  const RemovedFromWishlistState();
}

class RemovingFromWishlistErrorState extends WishlistState {
  final int productId;
  final ApiErrorModel apiErrorModel;
  const RemovingFromWishlistErrorState(this.apiErrorModel, this.productId);
}

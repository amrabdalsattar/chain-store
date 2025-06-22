import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/wishlist_response.dart';
import '../../data/repos/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _repo;
  WishlistCubit(this._repo) : super(const WishlistLoadingState());

  List<int> wishlistProductsIDs = [];
  List<WishlistProductModel> wishlistProducts = [];

  Future<void> getWishlistItems() async {
    final result = await _repo.getWishlistItems();
    result.when(
      success: (products) {
        if (isClosed) return;
        wishlistProducts = products;
        wishlistProductsIDs =
            wishlistProducts
                .map((product) => int.parse(product.productId.toString()))
                .toList();
        if (wishlistProducts.isEmpty) {
          emit(const WishlistEmptyState());
        } else {
          emit(WishlistLoadedState(wishlistProducts));
        }
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(WishlistErrorState(apiErrorModel));
      },
    );
  }

  Future<void> addToWishlist(int productId) async {
    emit(AddingToWishlistState(productId));
    if (wishlistProductsIDs.contains(productId)) return;
    wishlistProductsIDs.add(productId);
    final result = await _repo.addToWishlist(productId);
    result.when(
      success: (success) {
        if (isClosed) return;
        getWishlistItems();
        emit(WishlistLoadedState(wishlistProducts));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        wishlistProductsIDs.remove(productId);
        emit(AddingToWishlistErrorState(apiErrorModel, productId));
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(RemovingFromWishlistState(productId));
    if (!wishlistProductsIDs.contains(productId)) return;
    wishlistProductsIDs.remove(productId);
    wishlistProducts.removeWhere((product) => product.productId == productId);
    final result = await _repo.removeFromWishlist(productId);
    result.when(
      success: (success) {
        if (isClosed) return;
        if (wishlistProducts.isEmpty) {
          emit(const WishlistEmptyState());
        } else {
          emit(WishlistLoadedState(wishlistProducts));
        }
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        wishlistProductsIDs.add(productId);
        emit(RemovingFromWishlistErrorState(apiErrorModel, productId));
      },
    );
  }

  bool isProductInWishlist(int productId) {
    return wishlistProductsIDs.contains(productId);
  }
}

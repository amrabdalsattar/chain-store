import 'package:bloc/bloc.dart';

import '../../data/models/cart_response_model.dart';
import '../../data/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(const CartInitialState());
  List<CartItemModel> cartItems = [];
  double totalPrice = 0;

  void clearCart() {
    cartItems.clear();
    emit(const EmptyCartState());
  }

  Future<void> addToCart(int productId, int quantity) async {
    emit(const AddingItemToCartState());
    final result = await _repo.addToCart(productId, quantity);

    result.when(
      success: (message) {
        getCartInfo();
        emit(const ItemAddedToCartState());
      },
      failure: (apiErrorModel) {
        emit(ErrorCartState(apiErrorModel));
      },
    );
  }

  Future<void> getCartInfo() async {
    emit(const LoadingCartInfoState());
    final result = await _repo.getCartInfo();

    result.when(
      success: (cartInfo) {
        totalPrice = cartInfo.total!;
        cartItems = cartInfo.items!;

        if (cartItems.isEmpty) {
          emit(const EmptyCartState());
        } else {
          emit(LoadedCartInfoState(cartInfo));
        }
      },
      failure: (apiErrorModel) {
        emit(ErrorCartState(apiErrorModel));
      },
    );
  }

  Future<void> removeFromCart(int itemId) async {
    emit(const RemovingItemFromCartState());
    cartItems.removeWhere((item) => item.productId == itemId);
    final result = await _repo.removeFromCart(itemId);

    result.when(
      success: (success) {
        getCartInfo();
        emit(const ItemRemovedFromCartState());
      },
      failure: (apiErrorModel) {
        emit(ErrorCartState(apiErrorModel));
      },
    );
  }

  bool isInCart(int productId) {
    return cartItems.any((item) => item.productId == productId);
  }
}

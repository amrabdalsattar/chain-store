import 'package:bloc/bloc.dart';

import '../../data/models/cart_response_model.dart';
import '../../data/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  CartCubit(this._repo) : super(const CartInitialState());
  List<CartItemModel> cartItems = [];

  void getCartInfo() async {
    emit(const LoadingCartInfoState());
    final result = await _repo.getCartInfo();

    result.when(
      success: (cartInfo) {
        cartItems = cartInfo.items;
        if (cartItems.isEmpty) {
          emit(const EmptyCartState());
        }
        emit(LoadedCartInfoState(cartInfo));
      },
      failure: (apiErrorModel) {
        emit(ErrorCartState(apiErrorModel));
      },
    );
  }
}

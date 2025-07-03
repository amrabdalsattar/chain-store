import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/cart_response_model.dart';

abstract class CartState {
  const CartState();
}

class CartInitialState extends CartState {
  const CartInitialState();
}

// Fetching Cart Info states
class LoadingCartInfoState extends CartState {
  const LoadingCartInfoState();
}

class LoadedCartInfoState extends CartState {
  final CartInfo cartInfo;

  const LoadedCartInfoState(this.cartInfo);
}

class EmptyCartState extends CartState {
  const EmptyCartState();
}

class ErrorCartState extends CartState {
  final ApiErrorModel apiErrorModel;

  const ErrorCartState(this.apiErrorModel);
}

// Cart Operations states
class AddingItemToCartState extends CartState {
  const AddingItemToCartState();
}

class ItemAddedToCartState extends CartState {
  const ItemAddedToCartState();
}

class ItemAddingErrorState extends CartState {
  final ApiErrorModel apiErrorModel;
  const ItemAddingErrorState(this.apiErrorModel);
}

class RemovingItemFromCartState extends CartState {
  const RemovingItemFromCartState();
}

class ItemRemovedFromCartState extends CartState {
  const ItemRemovedFromCartState();
}

class ItemRemovalErrorState extends CartState {
  final ApiErrorModel apiErrorModel;
  const ItemRemovalErrorState(this.apiErrorModel);
}

class ItemQuantityChangedState extends CartState {}

class ChangeCartItemLoadingState extends CartState {}

class ChangeCartItemErrorState extends CartState {
  final ApiErrorModel error;

  ChangeCartItemErrorState(this.error);
}

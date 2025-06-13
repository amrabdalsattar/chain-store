import 'package:bloc/bloc.dart';

import 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartState> {
  CartCubitCubit() : super(const CartInitialState());
}

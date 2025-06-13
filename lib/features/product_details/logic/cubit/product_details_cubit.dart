import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsState.initial());

  String? _selectedSize;
  int _selectedColorIndex = 0;
  int _quantity = 1;

  String? get selectedSize => _selectedSize;
  int get selectedColorIndex => _selectedColorIndex;
  int get quantity => _quantity;

  void selectSize(String size) {
    _selectedSize = size;
    emit(ProductDetailsState.loaded(
      selectedSize: _selectedSize,
      selectedColorIndex: _selectedColorIndex,
      quantity: _quantity,
    ));
  }

  void selectColor(int index) {
    _selectedColorIndex = index;
    emit(ProductDetailsState.loaded(
      selectedSize: _selectedSize,
      selectedColorIndex: _selectedColorIndex,
      quantity: _quantity,
    ));
  }

  void increaseQuantity() {
    _quantity++;
    emit(ProductDetailsState.loaded(
      selectedSize: _selectedSize,
      selectedColorIndex: _selectedColorIndex,
      quantity: _quantity,
    ));
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      emit(ProductDetailsState.loaded(
        selectedSize: _selectedSize,
        selectedColorIndex: _selectedColorIndex,
        quantity: _quantity,
      ));
    }
  }
}
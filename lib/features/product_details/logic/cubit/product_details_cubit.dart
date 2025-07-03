import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/product_details_response.dart';
import '../../data/repos/product_details_repo.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;
  ProductDetailsCubit(this._productDetailsRepo)
    : super(const ProductDetailsState.initial());

  String? _selectedSize;
  int _selectedColorIndex = 0;
  int _quantity = 1;
  late int _productId;
   late ProductDetailsResponse _currentProduct;

  String? get selectedSize => _selectedSize;
  int get selectedColorIndex => _selectedColorIndex;
  int get productId => _productId;
  ProductDetailsResponse get currentProduct=>_currentProduct;

  int get quantity => _quantity;

  Future<void> fetchProductDetails(int productId) async {
    _productId = productId;
    final response = await _productDetailsRepo.getProductDetails(productId);

    response.when(
      success: (prodcut) {
        _currentProduct = prodcut;
        emit(ProductDetailsState.loaded(prodcut));
      },
      failure: (error) {
        emit(ProductDetailsState.error(error.message ?? 'Unkown Error'));
      },
    );
  }

  void selectSize(String size) {
    _selectedSize = size;
    emit(
      ProductDetailsState.attributeChanged(
        selectedSize: _selectedSize,
        selectedColorIndex: _selectedColorIndex,
        quantity: _quantity,
      ),
    );
  }

  void selectColor(int index) {
    _selectedColorIndex = index;
    emit(
      ProductDetailsState.attributeChanged(
        selectedSize: _selectedSize,
        selectedColorIndex: _selectedColorIndex,
        quantity: _quantity,
      ),
    );
  }

  void increaseQuantity() {
    _quantity++;
    emit(
      ProductDetailsState.attributeChanged(
        selectedSize: _selectedSize,
        selectedColorIndex: _selectedColorIndex,
        quantity: _quantity,
      ),
    );
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      emit(
        ProductDetailsState.attributeChanged(
          selectedSize: _selectedSize,
          selectedColorIndex: _selectedColorIndex,
          quantity: _quantity,
        ),
      );
    }
  }
}

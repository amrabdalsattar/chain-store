part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  
  const factory ProductDetailsState.loading() = _Loading;
  
  const factory ProductDetailsState.loaded({
    String? selectedSize,
    required int selectedColorIndex,
    required int quantity,
  }) = _Loaded;
  
  const factory ProductDetailsState.error(String message) = _Error;
}
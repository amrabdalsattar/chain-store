import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product_details/data/models/product_details_response.dart';
import '../../../product_details/logic/cubit/product_details_cubit.dart';
import '../../data/models/review_model.dart';
import '../../data/repos/rating_review_repo.dart';

part 'rating_reviews_state.dart';
part 'rating_reviews_cubit.freezed.dart';

class RatingReviewsCubit extends Cubit<RatingReviewsState> {
  final RatingReviewRepo _ratingReviewDatasource;
  final ProductDetailsCubit _productcubit;
  RatingReviewsCubit(this._ratingReviewDatasource, this._productcubit)
    : super(const RatingReviewsState.initial());

  TextEditingController reviewController = TextEditingController();
  FocusNode reviewFocus = FocusNode();

  late int _productId;
  double _rating = 0;
  String _errorMessage = '';
  double get rating => _rating;
  String get errorMessage => _errorMessage;

  Future<void> addReview() async {
    if (rating == 0) {
      _errorMessage = 'Please set a rate ';
      emit(const addProductReviewErrorMessage());
      return;
    }
    if (reviewController.text.isEmpty) {
      _errorMessage = 'Please Enter a review';
      emit(const addProductReviewErrorMessage());
      return;
    }
    emit(const addProductReviewLoading());
    final resposne = await _ratingReviewDatasource.addProductReivew(
      ReviewModel(
        productId: _productId,
        customerImage: '',
        customerName: '',
        rate: rating,
        review: reviewController.text,
      ),
    );
    resposne.when(
      success: (_) async {
        await _productcubit.fetchProductDetails(_productId);
        emit(addProductReviewSuccess(_productcubit.currentProduct));
        clearAll();
      },
      failure: (apiErrorModel) {
        emit(const addProductReviewFailed());
      },
    );
  }

  void setRating(double rating) {
    _rating = rating;
  }

  void setProductId(int productId) {
    _productId = productId;
  }

  void clearAll() {
    reviewController.clear();
    reviewFocus.unfocus();
    _rating = 0;
    _errorMessage = '';
    emit(const RatingReviewsState.initial());
  }
}

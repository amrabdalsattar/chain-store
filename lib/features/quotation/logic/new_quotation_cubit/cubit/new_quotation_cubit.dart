import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../../data/models/rfq_category_response.dart';
import '../../../data/models/rfq_request_model.dart';
import '../../../data/repos/quotation_repo.dart';

part 'new_quotation_state.dart';
part 'new_quotation_cubit.freezed.dart';

class NewQuotationCubit extends Cubit<NewQuotationState> {
  final QuotationRepo quotationRepo;

  // Form fields and controllers
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final detailsController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  List<File> images = [];
  List<RFQCategoryModel> categories = [];
  int? selectedCategory;
  bool shareBusinessCard = false;
  bool isPolicySelected = false;
  int rfqId = 0;
  bool isLoading = false;

  NewQuotationCubit({required this.quotationRepo})
    : super(const NewQuotationState.initial());

  Future<void> suggestDetailsWithGemini() async {
    final productName = nameController.text.trim();
    if (productName.isEmpty) return;

    emit(const NewQuotationState.fillWithAiLoading());
    try {
      // Prepare the categories string for the prompt
      final categoriesString = categories.map((c) => c.name).join(', ');

      final model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: 'AIzaSyCGFiuMBzuIW1q7T8ASrF9eNEsQZ5OMDLc',
      );
      final prompt =
          'do not exceed 500 charachter. '
          'Suggest a detailed purchasing requirement for the product: $productName. '
          'Available categories are: $categoriesString. '
          'Based on the product, which category is the best fit? '
          'Return only the category name. '
          'do not add anything about what you did and do not add summarization at the end.';

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      final suggestion = response.text?.trim() ?? '';

      // Set details as before
      detailsController.text = suggestion;

      // Try to match the suggested category to your list
      final matchedCategory =
          categories.isNotEmpty
              ? categories.firstWhere(
                (c) => c.name.toLowerCase() == suggestion.toLowerCase(),
                orElse: () => categories.first,
              )
              : null;
      if (matchedCategory != null) {
        selectedCategory = matchedCategory.id;
      }

      isLoading = true;
      emit(const NewQuotationState.fillWithAiSuccess());
    } catch (error) {
      emit(NewQuotationState.fillWithAiFalied(ApiErrorHandler.handle(error)));
    }
  }

  void selectCategory(String categoryId) {
    selectedCategory = int.tryParse(categoryId);
  }

  Future<void> fetchCategories() async {
    emit(const NewQuotationState.cateogrieLoading());
    final result = await quotationRepo.getAllCategories();
    result.when(
      success: (data) {
        final response = data as RFQCategoryResponse;
        categories = response.categories;
        emit(const NewQuotationState.cateogrieSuccess());
      },
      failure: (error) {
        emit(NewQuotationState.cateogrieFalied(ApiErrorHandler.handle(error)));
      },
    );
  }

  Future<void> submitQuotation() async {
    if (!isPolicySelected) {
      emit(
        NewQuotationState.error(
          ApiErrorModel(message: 'Please Accept the polices'),
        ),
      );
      return;
    }
    emit(const NewQuotationState.loading());
    final quotation = RFQRequestModel(
      customerId: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userId,
      ),
      productName: nameController.text,
      categoryId: selectedCategory ?? 0,
      quantity: int.tryParse(quantityController.text) ?? 0,
      unit: 'piece',
      shareBusinessCard: shareBusinessCard,
      description: detailsController.text,
      deadline: DateTime.now().add(const Duration(days: 7)).toIso8601String(),
    );
    print(
      'The RFQ Cateogry is ${quotation.categoryId} & ${categories[selectedCategory!]}',
    );
    final result = await quotationRepo.createQuotation(quotation);
    result.when(
      success: (id) {
        rfqId = id;
        emit(const NewQuotationState.success());
      },
      failure: (error) {
        emit(NewQuotationState.error(ApiErrorHandler.handle(error)));
      },
    );
  }

  void addImage(File image) {
    images.add(image);
    // No state change needed, as state is only for status
  }

  void removeImage() {
    if (images.isNotEmpty) {
      images.removeAt(0);
    }
    // No state change needed, as state is only for status
  }

  @override
  Future<void> close() {
    nameController.dispose();
    quantityController.dispose();
    detailsController.dispose();

    return super.close();
  }
}

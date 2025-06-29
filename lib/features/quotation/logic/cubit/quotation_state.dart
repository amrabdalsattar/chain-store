part of 'quotation_cubit.dart';

enum RFQState {
  manageRFQState,
  newRFQState,
  rfqQuotationsState,
  rfqInitailState,
  rfqImageUploading,
  quotationState,
}

class QuotationState {
  final bool isSubmitting;
  final bool isSubmitted;
  final RFQModel? quotation;
  final List<RFQCategoryModel> categories;
  final String? errorMessage;
  final int? selectedCategory;
  final bool isLoading;
  final List<SuppliersModel> matchedSuppliers;
  final List<RFQModel>? rfqs;
  final int rfqId;
  final int quotationId;
  final List<QuotationModel>? quotations;
  final RFQState rfqState;
  final bool clearErrorMessage; // NEW: flag for error clearing

  QuotationState({
    this.selectedCategory,
    required this.rfqId,
    required this.quotationId,
    this.rfqs,
    required this.isSubmitting,
    required this.isSubmitted,
    this.quotation,
    this.categories = const [],
    this.errorMessage,
    this.isLoading = false,
    this.matchedSuppliers = const [],
    this.quotations = const [],
    this.rfqState = RFQState.rfqInitailState,
    this.clearErrorMessage = false,
  });

  factory QuotationState.initial() {
    return QuotationState(
      isSubmitting: false,
      isSubmitted: false,
      quotation: null,
      categories: const [],
      errorMessage: null,
      selectedCategory: null,
      isLoading: false,
      matchedSuppliers: const [],
      rfqs: const [],
      rfqId: 0,
      quotations: [],
      rfqState: RFQState.rfqInitailState,
      quotationId: 0,
      clearErrorMessage: false,
    );
  }

  QuotationState copyWith({
    bool? isSubmitting,
    bool? isSubmitted,
    RFQModel? quotation,
    List<RFQCategoryModel>? categories,
    String? errorMessage,
    int? selectedCategory,
    bool? isLoading,
    List<SuppliersModel>? matchedSuppliers,
    List<RFQModel>? rfqs,
    int? rfqId,
    List<QuotationModel>? quotations,
    RFQState? rfqState,
    int? quotationId,
    bool clearErrorMessage = false,
  }) {
    return QuotationState(
      rfqs: rfqs ?? this.rfqs,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      quotation: quotation ?? this.quotation,
      categories: categories ?? this.categories,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      matchedSuppliers: matchedSuppliers ?? this.matchedSuppliers,
      rfqId: rfqId ?? this.rfqId,
      quotations: quotations ?? this.quotations,
      rfqState: rfqState ?? this.rfqState,
      quotationId: quotationId ?? this.quotationId,
      clearErrorMessage: clearErrorMessage,
    );
  }
}

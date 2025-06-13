part of 'quotation_cubit.dart';

class QuotationState {
  final bool isSubmitting;
  final bool isSubmitted;
  final QuotationModel? quotation;

  QuotationState({
    required this.isSubmitting,
    required this.isSubmitted,
    this.quotation,
  });

  factory QuotationState.initial() {
    return QuotationState(
      isSubmitting: false,
      isSubmitted: false,
      quotation: null,
    );
  }

  QuotationState copyWith({
    bool? isSubmitting,
    bool? isSubmitted,
    QuotationModel? quotation,
  }) {
    return QuotationState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      quotation: quotation ?? this.quotation,
    );
  }
}
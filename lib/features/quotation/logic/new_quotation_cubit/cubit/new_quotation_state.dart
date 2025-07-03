part of 'new_quotation_cubit.dart';

@freezed
class NewQuotationState with _$NewQuotationState {
  const factory NewQuotationState.initial() = _Initial;
  const factory NewQuotationState.loading() = NewQuotationLoadingState;
  const factory NewQuotationState.success() = NewQuotationSuccessState;
  const factory NewQuotationState.error(ApiErrorModel error) =
      NewQuotationErrorState;

  // Categorie States
  const factory NewQuotationState.cateogrieLoading() =
      NewQuotationCategorieLoadingState;
  const factory NewQuotationState.cateogrieSuccess() =
      NewQuotationCategorieSuccessState;
  const factory NewQuotationState.cateogrieFalied(ApiErrorModel error) =
      NewQuotationCategorieFailedState;

  // FillWithAi states
  const factory NewQuotationState.fillWithAiLoading() =
      NewQuotationfillWithAiLoadingState;
  const factory NewQuotationState.fillWithAiSuccess() =
      NewQuotationfillWithAiSuccessState;
  const factory NewQuotationState.fillWithAiFalied(ApiErrorModel error) =
      NewQuotationfillWithAiFailedState;

  // Image States
  const factory NewQuotationState.imageState() = NewQuotationImageState;
}

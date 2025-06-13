part of 'business_category_cubit.dart';

@freezed
class BusinessCategoryState with _$BusinessCategoryState {
  const factory BusinessCategoryState.initial() = _Initial;
  const factory BusinessCategoryState.categorySelected(String category) =
      BusinessCategorySelectedState;
  const factory BusinessCategoryState.categoryDeselected(String category) =
      BusinessCategoryDeselectedState;
  const factory BusinessCategoryState.categorySubmited(String category) =
      BusinessCategorySubmitedState;
}

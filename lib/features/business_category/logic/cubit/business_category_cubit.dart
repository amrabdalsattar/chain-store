import 'package:bloc/bloc.dart';
import 'package:connect_chain_market/core/helpers/app_images.dart';
import 'package:connect_chain_market/features/business_category/data/models/business_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_category_state.dart';
part 'business_category_cubit.freezed.dart';

class BusinessCategoryCubit extends Cubit<BusinessCategoryState> {
  BusinessCategoryCubit() : super(const BusinessCategoryState.initial());

  // Initialize categories list with models
  final List<BusinessCategoryModel> _categories = [
    const BusinessCategoryModel(name: 'Mobile Phone', iconPath: AppImages.mobilePhoneIcon),
    const BusinessCategoryModel(name: 'Electronics', iconPath: AppImages.electronicsIcon),
    const BusinessCategoryModel(name: 'Sports', iconPath: AppImages.sportsIcon),
    const BusinessCategoryModel(name: 'Clothes', iconPath: AppImages.clothesIcon),
    const BusinessCategoryModel(name: 'Bags', iconPath: AppImages.bagsIcon),
    const BusinessCategoryModel(name: 'Other', iconPath: AppImages.addIcon),
  ];

  // Getter for categories
  List<BusinessCategoryModel> get categories => _categories;

  // Track selected categories
  final List<String> _selectedCategories = [];
  List<String> get selectedCategories => _selectedCategories;

  // Check if button should be enabled
  bool get isButtonEnabled => _selectedCategories.isNotEmpty;

  // Toggle category selection
  void toggleCategorySelection(String categoryName) {
    if (_selectedCategories.contains(categoryName)) {
      _deselectCategory(categoryName);
    } else {
      _selectCategory(categoryName);
    }
  }

  // Check if a category is selected
  bool isCategorySelected(String categoryName) {
    return _selectedCategories.contains(categoryName);
  }

  // Select a category
  void _selectCategory(String categoryName) {
    _selectedCategories.add(categoryName);
    emit(BusinessCategorySelectedState(categoryName));
  }
  
  // Submit selected categories
  // void submitCategories() {
  //   if (_selectedCategories.isNotEmpty) {
  //     emit(const BusinessCategoryState.submitted());
  //   }
  // }

  // Deselect a category
  void _deselectCategory(String categoryName) {
    _selectedCategories.remove(categoryName);
    emit(BusinessCategoryDeselectedState(categoryName));
  }

  // Submit selected categories
  void submitCategories() {
    if (_selectedCategories.isNotEmpty) {
      emit(BusinessCategorySubmitedState(_selectedCategories.join(', ')));
    }
  }
}

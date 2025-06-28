import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/categories_cubit.dart';
import 'category_products_grid.dart';

class CategoryProductsBlocBuilder extends StatefulWidget {
  final int categoryId;
  const CategoryProductsBlocBuilder({super.key, required this.categoryId});

  @override
  State<CategoryProductsBlocBuilder> createState() =>
      _CategoryProductsBlocBuilderState();
}

class _CategoryProductsBlocBuilderState
    extends State<CategoryProductsBlocBuilder> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getProductsByCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is ProductsLoadingState ||
              current is ProductsLoadedState ||
              current is ProductsErrorState,
      builder: (context, state) {
        switch (state) {
          case ProductsLoadingState():
            return const LoadingIndicator();
          case ProductsLoadedState():
            return CategoryProductsGrid(products: state.products);
          case ProductsErrorState():
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Text(
                  state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

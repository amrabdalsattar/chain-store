import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/categories_cubit.dart';
import 'tab_bar/custom_tab_controller.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is CategoriesLoadedState ||
              current is CategoriesErrorState ||
              current is CategoriesLoadingState,
      builder: (_, state) {
        switch (state) {
          case CategoriesLoadingState():
            return const LoadingIndicator();
          case CategoriesLoadedState():
            return CustomTabController(categories: state.categories);
          case CategoriesErrorState():
            return Center(
              child: Text(
                state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

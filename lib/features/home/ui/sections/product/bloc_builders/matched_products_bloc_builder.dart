import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/loading_indicator.dart';
import '../../../../logic/cubit/home_cubit.dart';
import '../../../widgets/product_grid.dart';

class MatchedProductsBlocBuilder extends StatelessWidget {
  const MatchedProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen:
          (previous, current) =>
              current is MatchedProductsLoadedState ||
              current is MatchedProductsErrorState ||
              current is MatchedProductsLoadingState ||
              current is HomeInitialState,
      builder: (context, state) {
        switch (state) {
          case MatchedProductsLoadingState() || HomeInitialState():
            return const LoadingIndicator();
          case MatchedProductsLoadedState():
            return ProductGrid(products: state.products);
          case MatchedProductsErrorState():
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

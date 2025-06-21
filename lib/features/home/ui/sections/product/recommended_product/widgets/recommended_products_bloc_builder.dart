import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/widgets/loading_indicator.dart';
import '../../../../../logic/cubit/home_cubit.dart';

class RecommendedProductsBlocBuilder extends StatelessWidget {
  const RecommendedProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen:
          (previous, current) =>
              current is RecommendedProductsLoadedState ||
              current is RecommendedProductsErrorState ||
              current is RecommendedProductsLoadingState ||
              current is HomeInitialState,
      builder: (context, state) {
        switch (state) {
          case RecommendedProductsLoadingState() || HomeInitialState():
            return const LoadingIndicator();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

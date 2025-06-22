import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/widgets/shimmer_loading_list.dart';
import '../../../../../logic/cubit/home_cubit.dart';
import '../../../../widgets/section_header.dart';
import 'recommended_products_list_view.dart';

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
            return const ShimmerLoadingList(
              itemCount: 3,
              containerWidth: 120,
              containerHeight: 180,
              scrollDirection: Axis.horizontal,
              listHeight: 180,
            );
          case RecommendedProductsLoadedState():
            return HomeSection(
              title: 'Recommended',
              child: RecommendedProductsListView(products: state.products),
            );
          case RecommendedProductsErrorState():
            return const SizedBox.shrink();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

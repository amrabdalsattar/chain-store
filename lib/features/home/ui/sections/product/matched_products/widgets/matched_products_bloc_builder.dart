import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/widgets/loading_indicator.dart';
import '../../../../../logic/cubit/home_cubit.dart';
import '../../../../widgets/section_header.dart';
import 'matched_product_grid.dart';

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
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: const LoadingIndicator(),
            );
          case MatchedProductsLoadedState():
            return HomeSection(
              title: 'Matched Products ',
              onSeeAllPressed: () {},

              child: MatchedProductGrid(products: state.products),
            );
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

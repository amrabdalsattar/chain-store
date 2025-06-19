import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home_cubit.dart';
import 'top_suppliers_list_view.dart';
import 'top_suppliers_shimmer_loading.dart';

class TopSuppliersBlocBuilder extends StatelessWidget {
  const TopSuppliersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      buildWhen:
          (previous, current) =>
              current is HomeSuppliersLoadedState ||
              current is HomeSuppliersErrorState ||
              current is HomeSuppliersLoadingState,
      builder: (context, state) {
        switch (state) {
          case HomeSuppliersLoadingState():
            return const TopSuppliersShimmerLoading();
          case HomeSuppliersLoadedState():
            return TopSuppliersListView(suppliers: homeCubit.localSuppliers);
          case HomeSuppliersErrorState():
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

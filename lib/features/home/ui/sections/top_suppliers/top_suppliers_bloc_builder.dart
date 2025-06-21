import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main/logic/cubit/main_cubit.dart';
import '../../../logic/cubit/home_cubit.dart';
import '../../widgets/section_header.dart';
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
              current is HomeInitialState ||
              current is HomeSuppliersLoadingState,
      builder: (context, state) {
        switch (state) {
          case HomeSuppliersLoadingState() || HomeInitialState():
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: const TopSuppliersShimmerLoading(),
            );
          case HomeSuppliersLoadedState():
            return HomeSection(
              title: 'Top Suppliers',
              onSeeAllPressed: () {
                context.read<MainCubit>().toggleCurrentTabIndex = 3;
              },
              child: TopSuppliersListView(suppliers: homeCubit.localSuppliers),
            );
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

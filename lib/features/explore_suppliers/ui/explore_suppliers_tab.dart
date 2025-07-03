import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';

import '../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../data/repos/suppliers_repo.dart';
import '../logic/cubit/suppliers_cubit.dart';
import 'widgets/suppliers_filtration_bloc_builder.dart';
import 'widgets/suppliers_filtration_section.dart';
import 'widgets/suppliers_tab_header.dart';

class ExploreSuppliersTab extends StatefulWidget {
  const ExploreSuppliersTab({super.key});

  @override
  State<ExploreSuppliersTab> createState() => _ExploreSuppliersTabState();
}

class _ExploreSuppliersTabState extends State<ExploreSuppliersTab> {
  late final SuppliersCubit suppliersCubit;

  @override
  void initState() {
    suppliersCubit = SuppliersCubit(getIt<SuppliersRepo>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => suppliersCubit,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, right: 24.w, left: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SuppliersTabHeader(),
                verticalSpace(24),
                const SuppliersFiltrationSection(),
                verticalSpace(32),
                BlocProvider.value(
                  value: context.read<WishlistCubit>(),
                  child: BlocProvider.value(
                    value: context.read<CartCubit>(),
                    child: const SuppliersFiltrationBlocBuilder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

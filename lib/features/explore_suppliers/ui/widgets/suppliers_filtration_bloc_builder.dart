import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../logic/cubit/suppliers_cubit.dart';
import 'queried_suppliers_list_view.dart';

class SuppliersFiltrationBlocBuilder extends StatelessWidget {
  const SuppliersFiltrationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SuppliersCubit, SuppliersState>(
        buildWhen:
            (previous, current) =>
                current is SuppliersLoaded ||
                current is SuppliersEmpty ||
                current is SuppliersError ||
                current is SuppliersLoading ||
                current is SuppliersInitial,
        builder: (context, state) {
          switch (state) {
            case SuppliersInitial():
              return _buildText('Start Exploring Suppliers');
            case SuppliersLoading():
              return const LoadingIndicator();
            case SuppliersLoaded():
              return QueriedSuppliersListView(suppliers: state.suppliers);
            case SuppliersEmpty():
              return _buildText('No suppliers matched');
            case SuppliersError():
              return _buildText(
                state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
              );
          }
        },
      ),
    );
  }

  Widget _buildText(String message) {
    return Center(child: Text(message, style: AppTextStyles.robotoBlackBold14));
  }
}

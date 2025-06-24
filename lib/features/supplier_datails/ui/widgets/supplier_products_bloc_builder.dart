part of '../supplier_details_screen.dart';

class SupplierProductsBlocBuilder extends StatelessWidget {
  const SupplierProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierProductsCubit, SupplierProductsState>(
      bloc: context.read<SupplierProductsCubit>(),
      buildWhen:
          (previous, current) =>
              current is SupplierProductsLoadingState ||
              current is SupplierProductsLoadedState ||
              current is SupplierProductsErrorState,
      builder: (context, state) {
        switch (state) {
          case SupplierProductsLoadingState():
            return ShimmerLoadingList(
              itemCount: 5,
              containerWidth: double.infinity,
              containerHeight: 72.h,
              scrollDirection: Axis.vertical,
              listHeight: 300.h,
            );
          case SupplierProductsLoadedState():
            return SupplierProductsListView(products: state.products);
          case SupplierProductsErrorState():
            return Center(
              child: Text(
                state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
              ),
            );
        }
      },
    );
  }
}

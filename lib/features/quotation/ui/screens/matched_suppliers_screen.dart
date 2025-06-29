import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_empty_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../data/models/rfq_recommended_supplier_response.dart';
import '../../logic/cubit/quotation_cubit.dart';

class MatchedSuppliersScreen extends StatelessWidget {
  const MatchedSuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matched Suppliers'), centerTitle: true),
      body: const MatchedSuppliersBlocBuilder(),
    );
  }
}

class MatchedSuppliersBlocBuilder extends StatelessWidget {
  const MatchedSuppliersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotationCubit, QuotationState>(
      builder: (context, state) {
        if (state.isLoading && state.matchedSuppliers.isEmpty) {
          return const Center(child: CustomLoadingIndicator());
        } else if (state.matchedSuppliers.isEmpty) {
          return const CustomEmptyWidget(message: 'No Suppliers Found');
        } else {
          final List<SuppliersModel> suppliers = state.matchedSuppliers;
          return ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: suppliers.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final supplier = suppliers[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListTile(
                  leading: CircleAvatar(child: Text(supplier.name[0])),
                  title: Text(supplier.name),
                  subtitle: Text('Rating: ${supplier.rating}'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16.w),
                  onTap: () {},
                ),
              );
            },
          );
        }
      },
    );
  }
}

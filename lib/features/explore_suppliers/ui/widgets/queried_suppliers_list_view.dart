import 'package:flutter/material.dart';

import '../../../home/data/models/suppliers_response_model.dart';
import 'queried_supplier_item.dart';

class QueriedSuppliersListView extends StatelessWidget {
  final List<SupplierDataModel> suppliers;
  const QueriedSuppliersListView({super.key, required this.suppliers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: suppliers.length,
      itemBuilder:
          (context, index) => QueriedSupplierItem(supplier: suppliers[index]),
    );
  }
}

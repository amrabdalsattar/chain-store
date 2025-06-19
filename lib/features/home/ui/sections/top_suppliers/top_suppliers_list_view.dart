import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/suppliers_response_model.dart';
import 'supplier_card.dart';

class TopSuppliersListView extends StatelessWidget {
  final List<SupplierDataModel> suppliers;
  const TopSuppliersListView({super.key, required this.suppliers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: suppliers.length,
        itemBuilder:
            (context, index) => SupplierCard(supplier: suppliers[index]),
      ),
    );
  }
}

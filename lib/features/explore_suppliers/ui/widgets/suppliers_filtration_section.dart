import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_search_text_form_field.dart';
import '../../logic/cubit/suppliers_cubit.dart';

class SuppliersFiltrationSection extends StatelessWidget {
  const SuppliersFiltrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: CustomSearchTextFormField(
            onChanged:
                (query) =>
                    context.read<SuppliersCubit>().exploreSuppliers(query),
          ),
        ),
        const Expanded(flex: 1, child: Icon(Icons.filter_list_rounded)),
      ],
    );
  }
}

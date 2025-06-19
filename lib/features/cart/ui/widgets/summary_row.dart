import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/format_utils.dart';
import '../../data/models/cart_response_model.dart';
import '../../logic/cart_cubit/cart_cubit.dart';

class SummaryRow extends StatelessWidget {
  final CartInfo cartInfo;
  const SummaryRow({super.key, required this.cartInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total(${context.read<CartCubit>().cartItems.length} ${getPluralOrSingular('item', context.read<CartCubit>().cartItems.length)}) :',
          style: AppTextStyles.rubikSemiGreyRegular12,
        ),
        Text('${cartInfo.total} EGP', style: AppTextStyles.rubikBlackRegular16),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../main/logic/cubit/main_cubit.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImages.emptyCart),
          verticalSpace(16),
          Text('Your cart is empty', style: AppTextStyles.rubikBlackBold20),
          verticalSpace(8),
          Text(
            'Looks like you haven’t added any items yet.',
            style: AppTextStyles.robotoBlackRegular12,
            textAlign: TextAlign.center,
          ),
          verticalSpace(16),
          CustomButton(
            title: 'Start Shopping',
            width: MediaQuery.of(context).size.width * 0.7,
            radius: 32,
            height: 41,
            borderColor: ColorsHelper.primaryColor,

            onTap: () {
              context.read<MainCubit>().toggleCurrentTabIndex = 4;
            },
          ),
        ],
      ),
    );
  }
}

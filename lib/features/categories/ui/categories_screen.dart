import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/basic_app_bar.dart';
import '../logic/cubit/categories_cubit.dart';
import 'widgets/categories_bloc_builder.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt())..getCategories(),
      child: Scaffold(
        backgroundColor: ColorsHelper.white,
        appBar: BasicAppBar(
          title: 'Categories',
          isFirstScreen: true,
          centerTitle: false,
          titleStyle: AppTextStyles.robotoBlackBold20,
          actionWidget: const Icon(
            Icons.help_outline_rounded,
            color: ColorsHelper.secondaryGray,
          ),
        ),
        body: const CategoriesBlocBuilder(),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../data/models/categories_response_model.dart';
import '../category_products_bloc_builder.dart';
import 'category_tab_widget.dart';
part 'custom_tab_bar.dart';
part 'custom_tab_bar_view.dart';

class CustomTabController extends StatelessWidget {
  final List<Category> categories;
  const CustomTabController({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Row(
        children: [
          Expanded(flex: 3, child: CustomTabBar(categories: categories)),
          Expanded(flex: 7, child: CustomTabBarView(categories: categories)),
        ],
      ),
    );
  }
}

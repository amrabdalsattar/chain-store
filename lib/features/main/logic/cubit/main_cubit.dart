import '../../../cart_checkout/ui/shopping_cart_screen.dart/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/cache/user_data_operator.dart';
import '../../../categories/ui/categories_screen.dart';
import '../../../home/ui/home_screen.dart';
import '../../../profile/ui/profile_screen.dart';

class MainCubit extends Cubit<dynamic> {
  MainCubit() : super(0);

  int currentTabIndex = 2;

  set toggleCurrentTabIndex(int index) {
    currentTabIndex = index;
    emit(index);
  }

  List<Widget> mainTabs = [
    const ProfileScreen(),
    const ShoppingCartScreen(),
    const HomeScreen(),
    const Center(child: Text('Wishlist')),
    const CategoriesScreen(),
  ];

  // Bottom navigation items are now handled in CustomBottomNavBar

  Map<String, dynamic> userData = UserDataOperator.getUserData();
}

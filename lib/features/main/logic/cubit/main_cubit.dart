import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/cache/user_data_operator.dart';

import '../../ui/widgets/bottom_nav_bar_item_switcher.dart';

class MainCubit extends Cubit<dynamic> {
  MainCubit() : super(0);

  int currentTabIndex = 0;

  set toggleCurrentTabIndex(int index) {
    currentTabIndex = index;
    emit(index);
  }

  List<Widget> mainTabs = [];

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
    buildBottomNavItem(
      assetPath: '',
      label: 'الرئيسية',
      isSelected: currentTabIndex == 0,
    ),
    buildBottomNavItem(
      assetPath: '',
      label: 'الإشعارات',
      isSelected: currentTabIndex == 1,
    ),
    buildBottomNavItem(
      assetPath: '',
      label: 'منتجاتي',
      isSelected: currentTabIndex == 2,
    ),
    buildBottomNavItem(
      assetPath: '',
      label: 'الطلبات',
      isSelected: currentTabIndex == 3,
    ),
    buildBottomNavItem(
      assetPath: '',
      label: 'الإعدادات',
      isSelected: currentTabIndex == 4,
    ),
  ];

  buildBottomNavItem({
    required String assetPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: BottomNavBarItemSwitcher(
        assetPath: assetPath,
        isSelected: isSelected,
        label: label,
      ),
      label: label,
    );
  }

  Map<String, dynamic> userData = UserDataOperator.getUserData();
}

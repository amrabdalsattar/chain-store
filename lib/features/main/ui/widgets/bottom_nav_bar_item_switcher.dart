import 'package:flutter/material.dart';

import 'selected_bottom_nav_bar_item.dart';
import 'unselected_bottom_nav_bar_item.dart';

class BottomNavBarItemSwitcher extends StatelessWidget {
  final String assetPath;
  final String label;
  final bool isSelected;
  const BottomNavBarItemSwitcher({
    super.key,
    required this.assetPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: isSelected
          ? SelectedBottomNavBarItem(assetPath: assetPath)
          : UnselectedBottomNavBarItem(assetPath: assetPath),
    );
  }
}

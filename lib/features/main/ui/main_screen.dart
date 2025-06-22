import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../logic/cubit/main_cubit.dart';
import 'widgets/bottom_navigation_bar/custom_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getCartInfo();
    context.read<WishlistCubit>().getWishlistItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return BlocBuilder<MainCubit, dynamic>(
      bloc: mainCubit,
      builder:
          (_, state) => Scaffold(
            body: mainCubit.mainTabs[mainCubit.currentTabIndex],
            bottomNavigationBar: const CustomBottomNavBar(),
          ),
    );
  }
}

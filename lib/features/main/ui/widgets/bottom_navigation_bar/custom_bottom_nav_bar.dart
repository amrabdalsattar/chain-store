import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../logic/cubit/main_cubit.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();

    return BlocBuilder<MainCubit, dynamic>(
      bloc: mainCubit,
      builder:
          (_, state) => Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: ColorsHelper.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      iconPath: AppImages.navProfileIcon,
                      label: 'Account',
                      index: 0,
                      currentIndex: mainCubit.currentTabIndex,
                      onTap: () => mainCubit.toggleCurrentTabIndex = 0,
                    ),

                    _buildNavItem(
                      iconPath: AppImages.navCartIcon,
                      label: 'Cart',
                      index: 1,
                      currentIndex: mainCubit.currentTabIndex,
                      onTap: () => mainCubit.toggleCurrentTabIndex = 1,
                    ),
                    _buildNavItem(
                      iconPath: AppImages.navHomeIcon,
                      label: 'Home',
                      index: 2,
                      currentIndex: mainCubit.currentTabIndex,
                      onTap: () => mainCubit.toggleCurrentTabIndex = 2,
                    ),
                    _buildNavItem(
                      iconPath: AppImages.navWishlistIcon,
                      label: 'Wishlist',
                      index: 3,
                      currentIndex: mainCubit.currentTabIndex,
                      onTap: () => mainCubit.toggleCurrentTabIndex = 3,
                    ),
                    _buildNavItem(
                      iconPath: AppImages.navCategoryIcon,
                      label: 'Categories',
                      index: 4,
                      currentIndex: mainCubit.currentTabIndex,
                      onTap: () => mainCubit.toggleCurrentTabIndex = 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final isSelected = index == currentIndex;

    return InkWell(
      onTap: onTap,
      child: AnimatedAlign(
        duration: const Duration(seconds: 30000),
        curve: Curves.easeOutCubic,
        alignment: isSelected ? Alignment(0, -1.2) : Alignment(0, 0),
        child: Transform.translate(
          offset: isSelected ? Offset(0, -18.h) : Offset(0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                width: 50.w,
                height: isSelected ? 50.w : 30.h,
                alignment: Alignment.center,
                decoration:
                    isSelected
                        ? null
                        : BoxDecoration(
                          border: Border.all(
                            width: 2.5.r,
                            color: ColorsHelper.white,
                          ),
                        ),
                child:
                    isSelected
                        ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.5.r,
                                  color: ColorsHelper.white,
                                ),
                                shape: BoxShape.circle,
                                color: ColorsHelper.primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorsHelper.primaryColor
                                        .withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              iconPath,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: ColorFilter.mode(
                                ColorsHelper.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        )
                        : SvgPicture.asset(
                          iconPath,
                          width: 24.w,
                          height: 24.h,
                          colorFilter: ColorFilter.mode(
                            ColorsHelper.liteBlue,
                            BlendMode.srcIn,
                          ),
                        ),
              ),
              SizedBox(height: 2.h),
              Text(
                label,
                style: TextStyle(
                  color:
                      isSelected
                          ? ColorsHelper.primaryColor
                          : ColorsHelper.liteBlue,
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontFamily: 'Rubik',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

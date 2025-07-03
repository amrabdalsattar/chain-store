import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/utils/format_utils.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../logic/cubit/account_cubit.dart';
import 'widgets/app_informations.dart';
import 'widgets/logout_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: _AccountScreenContent(),
    );
  }
}

class _AccountScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        state.maybeWhen(
          logoutSuccess: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: ColorsHelper.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                onPressed: () {
                  context.pushNamed(Routes.customerSupportScreenRoute);
                },
                child: const Icon(
                  Icons.support_agent_rounded,
                  color: ColorsHelper.liteGray,
                ),
              ),
              backgroundColor: ColorsHelper.homeScaffoldColor,
              appBar: const CustomAppBar(
                title: 'Account',
                hideBackButton: true,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        // User Profile Section
                        ProfileHeader(
                          name: SharedPreferencesHelper.getString(
                            SharedPreferencesKeys.userName,
                          ),
                          email: SharedPreferencesHelper.getString(
                            SharedPreferencesKeys.userEmail,
                          ),
                          avatarText: getInitialLetters(
                            SharedPreferencesHelper.getString(
                              SharedPreferencesKeys.userName,
                            ),
                          ),
                        ),
                        verticalSpace(8),
                        const CustomDivider(),
                        // Menu Items
                        ProfileMenuItem(
                          iconPath: AppImages.profileIcon,
                          title: 'Profile',
                          subtitle: 'View and edit your personal information',
                          onTap: () {
                            context.pushNamed(Routes.profileScreenRoute);
                          },
                        ),

                        const CustomDivider(),

                        ProfileMenuItem(
                          iconPath: AppImages.notificationIcon,
                          title: 'Notification',
                          subtitle: 'Manage your alerts and preferences',
                          onTap: () {
                            // Navigate to notifications screen
                            // Navigator.of(context).pushNamed(Routes.notificationsScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileMenuItem(
                          iconPath: AppImages.wishlistIcon,
                          title: 'Wishlist',
                          subtitle: 'Save items to buy later',
                          onTap: () {
                            context.pushNamed(
                              Routes.wishlistScreenRoute,
                              arguments: {
                                'cartCubit': context.read<CartCubit>(),
                                'wishlistCubit': context.read<WishlistCubit>(),
                              },
                            );
                          },
                        ),
                        const CustomDivider(),
                        ProfileMenuItem(
                          iconPath: AppImages.orderHistoryIcon,
                          title: 'Orders history',
                          subtitle: 'Track your past purchases and receipts',
                          onTap: () {
                            context.pushNamed(Routes.ordersHistoryRoute);
                          },
                        ),
                        const CustomDivider(),
                        ProfileMenuItem(
                          iconPath: AppImages.settingsIcon,
                          title: 'Settings',
                          subtitle: 'Customize your app experience',
                          onTap: () {
                            // Navigate to settings screen
                            // Navigator.of(context).pushNamed(Routes.settingsScreen);
                          },
                        ),

                        const CustomDivider(),

                        // Logout Button
                        const LogoutButton(),
                        verticalSpace(32),
                        const AppInformations(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

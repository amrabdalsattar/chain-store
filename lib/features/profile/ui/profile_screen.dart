import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/utils/format_utils.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_divider.dart';
import '../logic/cubit/profile_cubit.dart';
import 'widgets/logout_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: _ProfileScreenContent(),
    );
  }
}

class _ProfileScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
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
                            // Navigate to profile edit screen
                            // Navigator.of(context).pushNamed(Routes.profileEditScreen);
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
                            // Navigate to wishlist screen
                            // Navigator.of(context).pushNamed(Routes.wishlistScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileMenuItem(
                          iconPath: AppImages.orderHistoryIcon,
                          title: 'Order history',
                          subtitle: 'Track your past purchases and receipts',
                          onTap: () {
                            // Navigate to order history screen
                            // Navigator.of(context).pushNamed(Routes.orderHistoryScreen);
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

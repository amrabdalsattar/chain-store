import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/routing/routes.dart';
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
                        const ProfileHeader(
                          name: 'Mohamed Alaa',
                          email: 'Mohamedelkarn2003@gmail.com',
                          avatarText: 'MO',
                        ),
                        verticalSpace(24),
                        _buildDivider(),
                        verticalSpace(18),

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
                        verticalSpace(18),
                        _buildDivider(),
                        verticalSpace(18),

                        ProfileMenuItem(
                          iconPath: AppImages.notificationIcon,
                          title: 'Notification',
                          subtitle: 'Manage your alerts and preferences',
                          onTap: () {
                            // Navigate to notifications screen
                            // Navigator.of(context).pushNamed(Routes.notificationsScreen);
                          },
                        ),
                        verticalSpace(18),
                        _buildDivider(),
                        verticalSpace(18),

                        ProfileMenuItem(
                          iconPath: AppImages.wishlistIcon,
                          title: 'Wishlist',
                          subtitle: 'Save items to buy later',
                          onTap: () {
                            // Navigate to wishlist screen
                            // Navigator.of(context).pushNamed(Routes.wishlistScreen);
                          },
                        ),
                        verticalSpace(18),
                        _buildDivider(),
                        verticalSpace(18),

                        ProfileMenuItem(
                          iconPath: AppImages.orderHistoryIcon,
                          title: 'Order history',
                          subtitle: 'Track your past purchases and receipts',
                          onTap: () {
                            // Navigate to order history screen
                            // Navigator.of(context).pushNamed(Routes.orderHistoryScreen);
                          },
                        ),
                        verticalSpace(18),
                        _buildDivider(),
                        verticalSpace(18),

                        ProfileMenuItem(
                          iconPath: AppImages.settingsIcon,
                          title: 'Settings',
                          subtitle: 'Customize your app experience',
                          onTap: () {
                            // Navigate to settings screen
                            // Navigator.of(context).pushNamed(Routes.settingsScreen);
                          },
                        ),
                        verticalSpace(18),
                        _buildDivider(),
                        verticalSpace(18),

                        // Logout Button
                        const LogoutButton(),
                        verticalSpace(32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Loading overlay
            if (state is ProfileLogoutLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: ColorsHelper.borderGray,
      thickness: 0.5,
      height: 1,
    );
  }
}

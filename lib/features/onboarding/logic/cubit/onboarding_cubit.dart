import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/cache/user_data_operator.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/onboarding_page_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  final PageController pageController = PageController();

  List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      title: 'All the suppliers in one place.',
      description:
          'We provide you with a wide network of suppliers so you can easily find the products you need, with multiple options and competitive prices to suit your business needs.',
      imagePath: AppImages.firstOnboardingPage,
    ),
    OnboardingPageModel(
      title: 'Manage your orders with ease',
      description:
          'Track all your orders from one place — from placing the order to receiving it — with instant notifications and real-time updates to ensure a smooth and organized experience.',
      imagePath: AppImages.secondOnboardingPage,
    ),
    OnboardingPageModel(
      title: 'Direct and fast communication.',
      description:
          'Communicate directly with suppliers within the app — discuss order details, inquire about products, and make informed decisions quickly and easily without any complications.',
      imagePath: AppImages.thirdOnboardingPage,
    ),
  ];

  void updatePageIndex(int index) => emit(index);

  void nextPage(BuildContext context) {
    final nextIndex = state + 1;
    if (nextIndex < onboardingPages.length) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      UserDataOperator.setViewOnBoardingBool();
      context.pushReplacementNamed(Routes.loginRoute);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

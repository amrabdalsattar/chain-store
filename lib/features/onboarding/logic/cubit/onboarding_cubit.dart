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
      title: 'كل الموردين في مكان واحد',
      description:
          'نوفر لك شبكة واسعة من الموردين لتتمكن من العثور على المنتجات التي تحتاجها بسهولة، مع خيارات متعددة وأسعار تنافسية لتناسب احتياجات عملك',
      imagePath: AppImages.firstOnboardingPage,
    ),
    OnboardingPageModel(
      title: 'إدارة طلباتك بكل سهولة',
      description:
          'تابع جميع طلباتك من مكان واحد، من تقديم الطلب حتى استلامه، مع إشعارات فورية وتحديثات لحظية لضمان تجربة سلسة ومنظمة',
      imagePath: AppImages.secondOnboardingPage,
    ),
    OnboardingPageModel(
      title: 'تواصل مباشر وسريع',
      description:
          'تواصل مع الموردين مباشرة داخل التطبيق، ناقش تفاصيل الطلبات، اسأل عن المنتجات، واتخذ قرارات مستنيرة بسرعة وسهولة دون أي تعقيدات',
      imagePath: AppImages.thirdOnboardingPage,
    )
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

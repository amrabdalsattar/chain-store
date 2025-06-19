import '../../features/business_category/logic/cubit/business_category_cubit.dart';
import '../../features/business_category/ui/business_category_screen.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/cart/logic/cart_cubit/cart_cubit.dart';
import '../../features/categories/ui/categories_screen.dart';
import '../../features/checkout_order/data/repos/checkout_repo.dart';
import '../../features/checkout_order/logic/cubit/checkout_cubit.dart';
import '../../features/checkout_order/ui/checkout_screen.dart/cart_checkout_screen.dart';
import '../../features/checkout_order/ui/order_confirmation_screen.dart/order_confirmation_screen.dart';
import '../../features/cart/ui/shopping_cart_screen.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/product_details/data/models/product_model.dart';
import '../../features/product_details/ui/product_details_screen.dart';
import '../../features/product_details/ui/ratings_reviews_screen.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/quotation/ui/quotation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/main/logic/cubit/main_cubit.dart';
import '../../features/main/ui/main_screen.dart';
import '../../features/onboarding/logic/cubit/onboarding_cubit.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/pre_login/logic/cubit/pre_login_cubit.dart';
import '../../features/pre_login/ui/pre_login_screen.dart';
import '../../features/reset_password/logic/cubit/reset_password_cubit.dart';
import '../../features/reset_password/ui/forgot_password_ui/forget_password_screen.dart';
import '../../features/reset_password/ui/otp_verification_ui/otp_screen.dart';
import '../../features/reset_password/ui/reset_password_ui/reset_password_screen.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../di/dependency_injection.dart';
import '../helpers/animations/custom_animations_builder.dart';
import 'routes.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginRoute:
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case Routes.preLoginScreenRoute:
        return CustomAnimationsBuilder.buildSlideRoute(
          screen: BlocProvider(
            create: (context) => PreLoginCubit(getIt()),
            child: const PreLoginScreen(),
          ),
          settings: settings,
        );
      case Routes.rattingScreenRoute:
        return CustomAnimationsBuilder.buildSlideRoute(
          screen: const RatingsReviewsScreen(),
          settings: settings,
        );

      case Routes.onboardingRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
          settings: settings,
        );
      case Routes.checkoutScreenRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: BlocProvider(
            create: (context) => CheckoutCubit(getIt<CheckoutRepo>()),
            child: const CartCheckoutScreen(),
          ),
          settings: settings,
        );

      case Routes.orderConfirmationRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: const OrderConfirmationScreen(),
          settings: settings,
        );

      case Routes.shoppingCartRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: const ShoppingCartScreen(),
          settings: settings,
        );

      case Routes.mainScreenRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => CartCubit(getIt<CartRepo>())),
              BlocProvider(create: (context) => MainCubit()),
            ],
            child: const MainScreen(),
          ),
          settings: settings,
        );
      case Routes.profileScreenRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: BlocProvider(
            create: (context) => ProfileCubit(),
            child: const ProfileScreen(),
          ),
          settings: settings,
        );
      case Routes.signUpRoute:
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider(
            create: (context) => SignupCubit(getIt()),
            child: const SignupScreen(),
          ),
          settings: settings,
        );
      case Routes.forgetPasswordScreenRoute:
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider(
            create: (context) => ResetPasswordCubit(getIt()),
            child: const ForgetPasswordScreen(),
          ),
          settings: settings,
        );
      case Routes.otpScreenRoute:
        final resetPasswordCubit = arguments as ResetPasswordCubit;
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider.value(
            value: resetPasswordCubit,
            child: const OtpScreen(),
          ),
          settings: settings,
        );
      case Routes.resetPasswordScreenRoute:
        final resetPasswordCubit = arguments as ResetPasswordCubit;
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider.value(
            value: resetPasswordCubit,
            child: const ResetPasswordScreen(),
          ),
          settings: settings,
        );

      case Routes.businessCategoryScreenRoute:
        return CustomAnimationsBuilder.slideFromLeft(
          screen: BlocProvider(
            create: (context) => BusinessCategoryCubit(),
            child: const BusinessCategoryScreen(),
          ),
          settings: settings,
        );

      case Routes.categoriesScreenRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: const CategoriesScreen(),
          settings: settings,
        );

      case Routes.quotationScreenRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: const QuotationScreen(),
          settings: settings,
        );

      case Routes.productDetailsRoute:
        return CustomAnimationsBuilder.buildFadeTransition(
          screen: ProductDetailsScreen(
            product: arguments as ProductModel? ?? ProductModel.sampleProduct(),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}

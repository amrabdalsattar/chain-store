import 'package:flutter/material.dart';

class CustomAnimationsBuilder {
  static PageRouteBuilder buildSlideRoute({
    required Widget screen,
    required RouteSettings settings,
    Offset beginOffset = const Offset(1.0, 0.0),
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }

  static PageRouteBuilder slideFromLeft({
    required Widget screen,
    required RouteSettings settings,
  }) {
    return buildSlideRoute(
      screen: screen,
      settings: settings,
      beginOffset: const Offset(-1.0, 0.0),
    );
  }

  static PageRouteBuilder buildFadeTransition({
    required Widget screen,
    required RouteSettings settings,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }

  static PageRouteBuilder buildHeroAnimation({
    required Widget screen,
    required RouteSettings settings,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }

  static PageRouteBuilder buildWidget({
    required Widget screen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
    );
  }
}

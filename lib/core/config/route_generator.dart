import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/features/login/login_view.dart';
import 'package:tracking_app/features/splash/presentation/views/widgets/on_boarding_view.dart';
import 'package:tracking_app/features/successScreen%20/success_screen.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
          settings: settings,
        );

      case RoutesName.successScreen:
        return MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
          settings: settings,
        );
      case RoutesName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
          settings: settings,
        );
    }
  }
}

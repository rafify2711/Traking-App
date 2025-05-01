import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/features/splash/presentation/views/widgets/on_boarding_view.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
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

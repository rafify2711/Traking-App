import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/forget_password_screen.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/reset_password_screen.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/verification_screen.dart';
import 'package:tracking_app/features/auth/login/home_screen.dart';
import 'package:tracking_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:tracking_app/features/apply/presentation/view/apply_screen.dart';
import 'package:tracking_app/features/on_boarding/presentation/views/widgets/on_boarding_view.dart';
import 'package:tracking_app/features/order_status/presentation/view/order_status_screen.dart';
import 'package:tracking_app/features/success_screen/success_screen.dart';



class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
          settings: settings,
        );
           case RoutesName.applyView:
        return MaterialPageRoute(
          builder: (context) => const ApplyScreen(),
          settings: settings,
        );

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.verificationScreen:
        return MaterialPageRoute(
          builder: (context) => VerificationScreen(),
          settings: settings,
        );
      case RoutesName.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
        case RoutesName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
        case RoutesName.successScreen:
        return MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
          settings: settings,
        );
        case RoutesName.orderStatusUpdate:
        return MaterialPageRoute(
          builder: (context) => const OrderStatusScreen(),
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

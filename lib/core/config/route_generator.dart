import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/forget_password_screen.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/reset_password_screen.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/view/verification_screen.dart';
import 'package:tracking_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:tracking_app/features/auth/apply/presentation/view/apply_screen.dart';
import 'package:tracking_app/features/home/presentation/views/home_view.dart';
import 'package:tracking_app/features/home/presentation/views/order_details_view.dart';
import 'package:tracking_app/features/home/presentation/views/pickup_location.dart';
import 'package:tracking_app/features/layOut/presentation/lay_out.dart';
import 'package:tracking_app/features/on_boarding/presentation/views/widgets/on_boarding_view.dart';
import 'package:tracking_app/features/orders/presentation/orders_view.dart';
import 'package:tracking_app/features/profile/presentation/profile_view.dart';
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
      
      case RoutesName.successScreen:
        return MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
          settings: settings,
        );
      case RoutesName.layOut:
        return MaterialPageRoute(
          builder: (context) => const LayOut(),
          settings: settings,
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case RoutesName.orders:
        return MaterialPageRoute(
          builder: (context) => const OrdersView(),
          settings: settings,
        );

      case RoutesName.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );

      case RoutesName.OrderDetailsView:
        return MaterialPageRoute(
          builder: (context) => const OrderDetailsView(),
          settings: settings,
        );
        case RoutesName.pickupLocationScreen:
        return MaterialPageRoute(
          builder: (context) => const PickupLocationScreen(),
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

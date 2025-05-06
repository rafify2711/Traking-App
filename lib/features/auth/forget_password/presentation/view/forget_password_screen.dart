import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit(
    getIt<ForgetPasswordUseCase>(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordCubit,
      child: const ForgetPasswordBody(),
    );
  }
}

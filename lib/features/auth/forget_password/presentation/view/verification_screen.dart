import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/sen_verify_code_use_case.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/verify_code_cubit.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/verification_body.dart';

class VerificationScreen extends StatelessWidget {
   VerificationScreen({super.key});
var cubit =VerifyCodeCubit(getIt<SenVerifyCodeUseCase>());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: VerificationBody(),
    );
  }
}

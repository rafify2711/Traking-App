import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_logged_driver_data_use_case.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_vechile_name_use_case.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:tracking_app/features/profile_tab/profile_screen.dart';


class ProfileView extends StatelessWidget {
  final viewModel = ProfileCubit(
    getIt<GetLoggedDriverDataUseCase>(),
    getIt<GetVechileNameUseCase>(),
  );
   ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => viewModel..getLoggedDriverData(),

      child: const ProfileScreen(),

    ); //Ma
  }
}
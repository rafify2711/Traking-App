import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/profile/domain/use_case/change_password_use_case.dart';
import 'package:tracking_app/features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:tracking_app/features/widgets/change_password_screen_body.dart';

import 'package:tracking_app/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<ChangePasswordUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(LocaleKeys.changePassword.tr()),
          titleSpacing: 0,
        ),
        body: const ChangePasswordScreenBody(),
      ),
    );
  }
}

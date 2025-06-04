import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/features/profile/presentation/views/widgets/change_password_screen_body.dart';

import 'package:tracking_app/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

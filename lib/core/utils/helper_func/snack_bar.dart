import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: PalletsColors.success,
      duration: const Duration(seconds: 3),
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: PalletsColors.error,
      duration: const Duration(seconds: 3),
    ),
  );
}

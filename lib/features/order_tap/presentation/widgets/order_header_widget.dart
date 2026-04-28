import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class OrderHeaderWidget extends StatelessWidget {
  const OrderHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.recentOrders.tr(),
            style: const TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

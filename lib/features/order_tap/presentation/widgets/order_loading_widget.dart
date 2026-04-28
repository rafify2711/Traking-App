import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class OrderLoadingWidget extends StatelessWidget {
  const OrderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: PalletsColors.mainColorBase,
        ),
      ),
    );
  }
}

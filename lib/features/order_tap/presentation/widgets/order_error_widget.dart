import 'package:flutter/material.dart';
import 'package:tracking_app/core/base/base_state.dart';

class OrderErrorWidget extends StatelessWidget {
  final BaseError error;
  
  const OrderErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.errorMessage ?? 'Unknown error'),
    );
  }
}

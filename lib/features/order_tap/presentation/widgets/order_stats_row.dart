import 'package:flutter/material.dart';
import 'order_status_card.dart';

class OrderStatsRow extends StatelessWidget {
  final String canceledCount;
  final String completedCount;

  const OrderStatsRow({
    super.key,
    required this.canceledCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(flex: 1),
        OrderStatusCard(
          count: canceledCount,
          status: "Canceled",
          icon: Icons.cancel_outlined,
          iconColor: Colors.red,
        ),
        const Spacer(flex: 5),
        OrderStatusCard(
          count: completedCount,
          status: "Completed",
          icon: Icons.check_circle_outline,
          iconColor: Colors.green,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class OrderStatusIndicator extends StatelessWidget {
  final String status;

  const OrderStatusIndicator({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    switch (status.toLowerCase()) {
      case "canceled":
        return Row(
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 10),
            Text(
              status,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        );
      case "completed":
        return Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            ),
            const SizedBox(width: 10),
            Text(
              status,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ],
        );
      default:
        return Row(
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Colors.blue,
            ),
            const SizedBox(width: 10),
            Text(
              status,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ],
        );
    }
  }
}

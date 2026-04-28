import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class OrderStatusCard extends StatelessWidget {
  final String count;
  final String status;
  final IconData icon;
  final Color iconColor;

  const OrderStatusCard({
    super.key,
    required this.count,
    required this.status,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(
        right: 70,
        top: 15,
        bottom: 15,
        left: 20,
      ),
      decoration: const BoxDecoration(
        color: PalletsColors.lightPink,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(count),
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}

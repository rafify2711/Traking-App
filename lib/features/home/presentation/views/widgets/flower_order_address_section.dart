import 'package:flutter/material.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';

class FlowerOrderAddressSection extends StatelessWidget {
  final String label;
  final String title;
  final String address;
  final String imagePath;
  final String orderNumber;

  const FlowerOrderAddressSection({
    super.key,
    required this.label,
    required this.title,
    required this.address,
    required this.imagePath,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(label),
        ),
        CustomCardWidget(
          withTrailing: false,
          title: title,
          addressOrPriceText: address,
          imagePath: imagePath,
          numberOfOrder: orderNumber,
        ),
      ],
    );
  }
}

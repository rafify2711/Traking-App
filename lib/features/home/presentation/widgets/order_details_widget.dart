import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/image 2.png"),
              radius: 16,
            ),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Red roses,15 Pink Rose Bouquet",
                  style: AppTextStyles.instance.textStyle13.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: PalletsColors.black70,
                    ),
                    const SizedBox(width: 10),
                    Text("EGP 600 ", style: AppTextStyles.instance.textStyle13),
                  ],
                ),
              ],
            ),
            trailing: const Text("x1"),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/widgets/flower_order_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PalletsColors.whiteBase,
        appBar: AppBar(
          backgroundColor: PalletsColors.whiteBase,
          title: Text(
            "Flowery rider",
            style: TextStyle(color: PalletsColors.mainColorBase),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [FlowerOrderCard(), FlowerOrderCard()],
            ),
          ),
        ),
      ),
    );
  }
}

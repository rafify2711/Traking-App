import 'package:flutter/material.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/pickup_location_screen_body.dart';

class PickupLocationScreen extends StatelessWidget {
  const PickupLocationScreen({super.key});
  @override
  Widget build (BuildContext context) {
    return const Scaffold(
      body: PickupLocationScreenBody(),
    );
  }
}

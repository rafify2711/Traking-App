import 'package:flutter/material.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/apply_view_body.dart';

class ApplyView extends StatelessWidget {
  const ApplyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Apply"),
      ),
      body: ApplyViewBody(),
    );
  }
}

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        Text('Apply'),
      ],
    );
  }
}

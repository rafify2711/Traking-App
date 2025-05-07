// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tracking_app/core/utils/colors.dart';

class AppBarSection extends StatelessWidget {
  final String text;
  const AppBarSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      // shadowColor: Colors.transparent,
      backgroundColor: PalletsColors.white10,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Text(text),
        ],
      ),
    );
  }
}

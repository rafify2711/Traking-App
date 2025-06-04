import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';

class DashMark extends StatelessWidget {
  const DashMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsiveHeight(16),
        bottom: responsiveHeight(24),
      ),
      child: Container(
        width: responsiveWidth(65),
        height: responsiveHeight(3),
        color: PalletsColors.mainColorBase,
      ),
    );
  }
}

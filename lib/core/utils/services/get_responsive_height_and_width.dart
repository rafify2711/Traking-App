

import 'package:flutter/widgets.dart';
import 'package:tracking_app/core/utils/services/screen_size_service.dart';
SizedBox responsiveHeightWidget(double height) => SizedBox(height: resposiveHeight(height));
SizedBox responsiveWidthWidget(double width) => SizedBox(width: resposiveWidth(width));
double resposiveHeight(double height) {
  final screenHeight = ScreenSizeService.height;
  return (height / ScreenSizeService.baseHeight) * screenHeight;
}

double resposiveWidth(double width) {
  final screenWidth = ScreenSizeService.width;
  return (width / ScreenSizeService.baseWidth) * screenWidth;
}

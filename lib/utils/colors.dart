import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//primary swatch
const Map<int, Color> primaryColor = {
  50: Color.fromRGBO(33, 153, 66, 0.1),
  100: Color.fromRGBO(33, 153, 66, 0.2),
  200: Color.fromRGBO(33, 153, 66, 0.3),
  300: Color.fromRGBO(33, 153, 66, 0.4),
  400: Color.fromRGBO(33, 153, 66, 0.5),
  500: Color.fromRGBO(33, 153, 66, 0.6),
  600: Color.fromRGBO(33, 153, 66, 0.7),
  700: Color.fromRGBO(33, 153, 66, 0.8),
  800: Color.fromRGBO(33, 153, 66, 0.9),
  900: Color.fromRGBO(33, 153, 66, 1),
};

const redPrimary = Color.fromRGBO(255, 0, 0, 1);
const redSecondary = Color.fromRGBO(191, 76, 12, 1);

const blackPrimary = Color.fromRGBO(0, 0, 0, 1);
const blackSecondary = Color.fromRGBO(48, 71, 63, 1);

const greyDark = Color.fromRGBO(51, 51, 51, 1);
const greyPrimary = Color.fromRGBO(153, 183, 173, 1);
const greySecondary = Color.fromRGBO(135, 148, 143, 1);
const greyTertiary = Color.fromRGBO(228, 243, 238, 1);
const greyQuaternary = Color.fromRGBO(224, 224, 224, 1);

const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
const whiteSecondary = Color.fromRGBO(217, 217, 217, 1);

const greenPrimary = Color.fromRGBO(33, 153, 66, 1);
const greenSecondary = Color.fromRGBO(19, 131, 64, 1);
const greenTertiary = Color.fromRGBO(165, 209, 186, 1);
const greenQuaternary = Color.fromRGBO(170, 216, 186, 1);

const shimmerBaseColor = Color.fromRGBO(200, 200, 200, 0.6);
const shimmerHighlightColor = Color.fromRGBO(243, 243, 243, 0.66);

// statusBar
whiteStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: whitePrimary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: whitePrimary);
}

transparentStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent);
}

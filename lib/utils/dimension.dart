import 'package:easy_note/main.dart';
import 'package:flutter/material.dart';

double get screenHeight =>
    MediaQuery.sizeOf(navigatorKey.currentContext!).height;
double get screenWidth => MediaQuery.sizeOf(navigatorKey.currentContext!).width;

const double designHeight = 844;
const double designWidth = 390;

double widgetHeight(double pixels) {
  return MediaQuery.sizeOf(navigatorKey.currentContext!).height /
      (designHeight / pixels);
}

double widgetWidth(double pixels) {
  return MediaQuery.sizeOf(navigatorKey.currentContext!).width /
      (designWidth / pixels);
}

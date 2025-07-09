import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.thickness});
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? greyQuaternary,
      thickness: thickness ?? 1.0,
    );
  }
}

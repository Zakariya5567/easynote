import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:easy_note/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(
      {super.key,
      this.onTap,
      this.color,
      this.height,
      this.width,
      this.isBack,
      required this.icon,
      this.userImage});

  final VoidCallback? onTap;
  final String icon;
  final bool? isBack;
  final Color? color;
  final double? height;
  final double? width;
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBack == true
          ? EdgeInsets.only(left: 0, right: 20.h, top: 10.h, bottom: 10.h)
          : EdgeInsets.zero,
      child: SvgPicture.asset(
        icon,
        height: height ?? 25.h,
        width: width ?? 25.h,
        color: color,
        // colorFilter: ColorFilter.mode(color ?? greyPrimary, BlendMode.src),
      ),
    ).onPress(onTap ?? () {});
  }
}

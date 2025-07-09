import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/style.dart';
import '../../helper/router_navigator.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import 'custom_button.dart';

void showMessageDialog({
  required bool isError,
  required String message,
  VoidCallback? onTap,
}) {
  showDialog(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 0.0,
        backgroundColor: whitePrimary,
        child: contentBox(context, isError, message, onTap),
      );
    },
  );
}

Widget contentBox(
    BuildContext context, bool isError, String message, VoidCallback? onTap) {
  return Container(
    width: 300.w,
    margin: EdgeInsets.all(20.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 20.height,
        SvgPicture.asset(
          isError ? Images.iconError : Images.iconSuccess,
          height: 90.h,
          width: 90.h,
        ),
        20.height,
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blackPrimary,
              fontSize: 16,
              fontWeight: w600,
              fontFamily: gothamRegular,
            ),
          ),
        ),
        20.height,
        PrimaryButton(
            width: 171.w,
            height: 55.h,
            buttonName: "OK",
            onPressed: onTap ?? () => goBack())
      ],
    ),
  );
}

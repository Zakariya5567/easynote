import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:easy_note/view/widgets/extention/string_extension.dart';
import 'package:easy_note/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../helper/router_navigator.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/style.dart';
import 'button_icon.dart';
import 'custom_button.dart';

deleteBottomSheet({
  required String title,
  required VoidCallback onDelete,
}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return Container(
        height: 290.h,
        decoration: const BoxDecoration(
            color: whitePrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonIcon(
                    icon: Images.iconCloseCircle,
                    color: blackSecondary,
                    onTap: () {
                      goBack();
                    },
                  ),
                  title.toText(fontSize: 18, fontFamily: gothamMedium),
                  10.width,
                ],
              ),
              14.height,
              ButtonIcon(
                icon: Images.iconDeleteAccountCircled,
                height: 90.h,
                width: 90.h,
              ),
              32.height,
              Row(
                children: [
                  PrimaryButton(
                      width: 171.w,
                      height: 55.h,
                      buttonColor: whitePrimary,
                      buttonTextColor: greenPrimary,
                      buttonName: "No",
                      onPressed: () {
                        goBack();
                      }),
                  16.width,
                  PrimaryButton(
                      width: 171.w,
                      height: 55.h,
                      buttonName: "Yes",
                      onPressed: onDelete)
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 16.w, vertical: 28.h),
        ),
      );
    },
  );
}

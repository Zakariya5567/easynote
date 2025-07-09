import 'package:easy_note/provider/home_provider.dart';
import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:easy_note/view/widgets/extention/string_extension.dart';
import 'package:easy_note/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../helper/router_navigator.dart';
import '../../../../helper/validation.dart';
import '../../../../main.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../widgets/button_icon.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

addNoteBottomSheet({
  required GlobalKey<FormState> formKey,
}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: navigatorKey.currentContext!,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Consumer<HomeProvider>(builder: (context, controller, child) {
        return Container(
          height: 784.h,
          decoration: const BoxDecoration(
              color: whitePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
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
                    "Add Note".toText(fontSize: 18, fontFamily: gothamMedium),
                    10.width,
                  ],
                ),
                24.height,

                //Tax Name
                CustomTextField(
                  label: "Title",
                  hintText: "Enter title for your note",
                  textInputType: TextInputType.text,
                  controller: controller.addTitleController,
                  validator: (value) {
                    return Validation.titleValidation(value);
                  },
                ).paddingOnly(bottom: 16.h),

                //Tax Rate
                CustomTextField(
                  label: "Description",
                  hintText: "Enter notes description",
                  maxLine: 5,
                  inputFormatter: 500,
                  validator: (value) {
                    return Validation.descriptionValidation(value);
                  },
                  controller: controller.addDescriptionController,
                ).paddingOnly(bottom: 16.h),
                16.height,
                PrimaryButton(
                    buttonName: "Save",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        goBack();
                        controller.addNote();
                      }
                    })
              ],
            ).paddingSymmetric(horizontal: 16.w, vertical: 28.h),
          ),
        );
      });
    },
  );
}

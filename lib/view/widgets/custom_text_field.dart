import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:easy_note/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.isBorder = true,
      this.isTextCapital = false,
      this.autovalidateMode,
      this.height,
      this.width,
      this.focusNode,
      this.validator,
      this.onChanged,
      this.onSubmitted,
      this.onSaved,
      this.borderColor = greyPrimary,
      this.hintColor = greyPrimary,
      this.isPassword = false,
      this.isSearch = false,
      this.radius = 5,
      this.iconPadding = 16,
      this.fillColor = whitePrimary,
      this.isVisible = false,
      this.inputFormatter = 50,
      this.isEdit = false,
      this.isReadOnly = false,
      this.isPrefixIcon = false,
      this.textInputFormatterList,
      this.onTap,
      this.label,
      this.maxLine = 1,
      this.suffixIcon,
      this.isSearchTap});

  TextEditingController controller;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool isBorder;
  double? height;
  double? width;
  bool isVisible;
  bool isEdit;
  bool isReadOnly;
  FocusNode? focusNode;
  bool isTextCapital;
  AutovalidateMode? autovalidateMode;

  Color borderColor;
  Color hintColor;
  bool isSearch;
  bool isPassword;
  double radius;
  Color fillColor;
  int inputFormatter;
  String? label;
  int iconPadding;
  int maxLine;
  List<TextInputFormatter>? textInputFormatterList;
  Widget? suffixIcon;
  bool isPrefixIcon;

  bool? isSearchTap;
  VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? label!.toText(
                fontSize: 14, fontFamily: gothamMedium, color: greySecondary)
            : const SizedBox(),
        label != null ? 5.height : const SizedBox(),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
              readOnly: isReadOnly,
              maxLines: maxLine,
              autofocus: false,
              cursorColor: blackSecondary,
              cursorWidth: 1,
              focusNode: focusNode,
              controller: controller,
              textCapitalization: isTextCapital == true
                  ? TextCapitalization.characters
                  : TextCapitalization.none,
              autovalidateMode: autovalidateMode ??
                  (controller.text.isNotEmpty
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction),
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: gothamRegular,
                  color: blackSecondary),
              obscureText: obscureText ?? false,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              textInputAction: textInputAction,
              onTap: onTap,
              onSaved: onSaved,
              inputFormatters: textInputFormatterList ??
                  [LengthLimitingTextInputFormatter(inputFormatter)],
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    fontSize: 16, color: redPrimary, fontFamily: gothamRegular),
                fillColor: fillColor,
                filled: isBorder == true ? true : false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                errorMaxLines: 2,
                hintStyle: TextStyle(
                    fontSize: 16, color: hintColor, fontFamily: gothamRegular),
                contentPadding: isBorder == true
                    ? EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w)
                    : null,
                suffixIcon: suffixIcon,
                prefixText: isPrefixIcon ? "+1 " : null,
                prefixStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: gothamRegular,
                    color: whitePrimary),
                border: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                errorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        borderSide:
                            const BorderSide(color: redPrimary, width: 1),
                      )
                    : InputBorder.none,
                focusedErrorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        borderSide:
                            const BorderSide(color: redPrimary, width: 2),
                      )
                    : InputBorder.none,
                enabledBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                focusedBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        borderSide:
                            const BorderSide(color: greenPrimary, width: 1),
                      )
                    : InputBorder.none,
              )),
        ),
      ],
    );
  }
}

import 'package:easy_note/data/model/note_model.dart';
import 'package:easy_note/helper/date_formatter.dart';
import 'package:easy_note/helper/router_navigator.dart';
import 'package:easy_note/provider/home_provider.dart';
import 'package:easy_note/view/widgets/custom_divider.dart';
import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:easy_note/view/widgets/extention/string_extension.dart';
import 'package:easy_note/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/style.dart';
import '../../widgets/button_icon.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key, this.note});
  final Note? note;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Consumer<HomeProvider>(builder: (context, controller, child) {
        return Scaffold(
            backgroundColor: whitePrimary,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              leading: ButtonIcon(
                isBack: true,
                icon: Images.iconBack,
                height: 15.h,
                width: 30.w,
                onTap: () => goBack(),
              ).paddingOnly(left: 10.w),
              backgroundColor: whitePrimary,
              centerTitle: false,
              title:
                  "Note Detail".toText(fontSize: 24, fontFamily: gothamMedium),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteDetailFields(
                    title: "Title", subtitle: widget.note?.title ?? ""),
                NoteDetailFields(
                    title: "Description",
                    subtitle: widget.note?.description ?? ""),
                NoteDetailFields(
                    title: "Date",
                    subtitle: getFormattedDate(widget.note?.dateTime) ?? ""),
                NoteDetailFields(
                    title: "Time",
                    subtitle: getFormattedTime(widget.note?.dateTime) ?? ""),
              ],
            ).paddingSymmetric(horizontal: 15.w, vertical: 10.h));
      }),
    );
  }
}

class NoteDetailFields extends StatelessWidget {
  const NoteDetailFields(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.toText(
          color: greySecondary,
          fontSize: 14,
          fontFamily: gothamMedium,
        ),
        8.height,
        subtitle.toText(
            maxLine: 10,
            color: blackSecondary,
            fontSize: 16,
            fontFamily: gothamRegular,
            fontWeight: w400),
        10.height,
        const Divider(
          color: greyQuaternary,
          thickness: 0.6,
        ),
        5.height,
      ],
    );
  }
}

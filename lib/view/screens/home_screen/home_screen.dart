import 'package:easy_note/helper/date_formatter.dart';
import 'package:easy_note/helper/router_navigator.dart';
import 'package:easy_note/helper/routes_helper.dart';
import 'package:easy_note/main.dart';
import 'package:easy_note/provider/home_provider.dart';
import 'package:easy_note/view/screens/home_screen/components/edit_note_bottomsheet.dart';
import 'package:easy_note/view/screens/note_detail_screen/note_detail_screen.dart';
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
import '../../widgets/delete_bottomsheet.dart';
import '../../widgets/no_data_found.dart';
import 'components/add_note_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  getNotes() {
    Future.delayed(Duration.zero, () {
      final homeProvider = Provider.of<HomeProvider>(
          navigatorKey.currentContext!,
          listen: false);
      homeProvider.fetchNotes();
    });
  }

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
              centerTitle: false,
              backgroundColor: whitePrimary,
              title:
                  "Easy Notes".toText(fontSize: 24, fontFamily: gothamMedium),
            ),
            floatingActionButton: Container(
                height: 64.h,
                width: 64.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: greenPrimary),
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: whitePrimary,
                )).onPress(() {
              controller.clearAddNoteFields();
              addNoteBottomSheet(
                formKey: formKey,
              );
            }),
            body: controller.notes.isEmpty
                ? const NoDataFound(
                    icon: Images.iconInvoiceNotFound,
                    title: "No Notes Found",
                    subtitle: "Click on the Add + Buttons to add Notes",
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.notes.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: greyQuaternary,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final note = controller.notes[index];
                      return SizedBox(
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonIcon(
                              height: 36.h,
                              width: 36.h,
                              icon: Images.iconUser,
                            ),
                            5.width,
                            SizedBox(
                              width: 190.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  2.height,
                                  (note.title ?? "Title").toText(
                                      fontSize: 16,
                                      fontFamily: gothamMedium,
                                      color: blackSecondary),
                                  5.height,
                                  (note.description ?? "Description").toText(
                                      fontSize: 14,
                                      fontFamily: gothamRegular,
                                      color: greyPrimary),
                                  5.height,
                                ],
                              ),
                            ),
                            5.width,
                            ButtonIcon(
                              height: 36.h,
                              width: 36.h,
                              icon: Images.iconEditPencilCirle,
                              onTap: () {
                                controller.clearEditNoteFields();
                                controller.updateEditNoteFields(note);
                                editNoteBottomSheet(
                                    formKey: formKey, id: note.id!);
                              },
                            ),
                            5.width,
                            ButtonIcon(
                              height: 36.h,
                              width: 36.h,
                              icon: Images.iconDelete,
                              onTap: () {
                                deleteBottomSheet(
                                    title: "Are you sure to delete?",
                                    onDelete: () {
                                      goBack();
                                      controller.deleteNote(note.id!);
                                    });
                              },
                            ),
                          ],
                        ).onPress(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NoteDetailScreen(note: note);
                          }));
                        }),
                      );
                    },
                  ).paddingSymmetric(horizontal: 15.w, vertical: 10.h));
      }),
    );
  }
}

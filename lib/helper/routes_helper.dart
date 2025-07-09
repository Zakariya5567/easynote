import 'package:easy_note/view/screens/note_detail_screen/note_detail_screen.dart';
import 'package:flutter/material.dart';
import '../view/screens/home_screen/home_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const homeScreen = "/homeScreen";
  static const noteDetail = "/noteDetail";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    homeScreen: (context) => const HomeScreen(),
    noteDetail: (context) => const NoteDetailScreen(),
  };
}

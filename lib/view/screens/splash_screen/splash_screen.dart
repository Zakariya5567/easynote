import 'dart:async';
import 'package:easy_note/view/screens/home_screen/components/add_note_bottomsheet.dart';
import 'package:easy_note/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helper/router_navigator.dart';
import '../../../helper/routes_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimension.dart';
import '../../../utils/images.dart';
import '../../widgets/extention/svg_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () async {
      goReplacementNamed(RouterHelper.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: transparentStatusBar(),
      child: Scaffold(
        backgroundColor: whitePrimary,
        body: Container(
          alignment: Alignment.center,
          height: screenHeight,
          width: screenWidth,
          child: Center(
            child: Image.asset(
              height: 180.h,
              width: 180.h,
              Images.noteLogo,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_note/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'helper/provider_helper.dart';
import 'helper/routes_helper.dart';
import 'helper/scroll_behaviour.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Alice To check API Response
    return MultiProvider(
      providers: ProviderHelper.providers,
      child: MaterialApp(
          navigatorKey: navigatorKey,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Easy Note',
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: const MaterialColor(0x219942, primaryColor),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
          ),
          initialRoute: RouterHelper.initial,
          routes: RouterHelper.routes),
    );
  }
}

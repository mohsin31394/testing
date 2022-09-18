import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_task/src/blocs/animals_bloc.dart';
import 'package:testing_task/src/ui/bottom_nav_bar/bottom_nav_bar_page.dart';
import 'package:testing_task/src/ui/home/home_page.dart';
import 'package:testing_task/src/ui/login/login_page.dart';
import 'package:testing_task/src/ui/signup/signup_page.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/utilities/constants.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await bloc.fetchAllAnimals();
  runApp(
    App(),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  bool darkModeOn=false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          AppConstants.designWidth, AppConstants.designHeight),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavBar(),
          theme: Styles.themeData(darkModeOn, context),
          navigatorKey: navigatorKey,
          routes: {
            '/bottom': (context) => BottomNavBar(),
            '/home': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
          },

        );
      },
    );
  }
}

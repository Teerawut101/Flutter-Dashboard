import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

import 'package:flutter/foundation.dart';
import '../../controllers/menu_app_controller.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final storage = new LocalStorage('AppLK');
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (_, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dashboard',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: Colors.white),
              canvasColor: secondaryColor,
            ),
            home: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuAppController(),
                ),
              ],
             // child: MainScreen(),
              child:Login(),
            ),
          );
        });
  }
}

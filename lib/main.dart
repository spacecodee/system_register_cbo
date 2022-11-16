import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_register_cbo/src/core/firebase_options.dart';
import 'package:system_register_cbo/src/routes/routes.gr.dart';
import 'package:system_register_cbo/src/utils/sc_colors.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  static const String title = 'Library Book App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ScColors.secondary,
          primary: ScColors.primary,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: ScColors.primary,
          textTheme: ButtonTextTheme.primary,
        ),
        backgroundColor: ScColors.primary,
      ),
      title: MyApp.title,
    );
  }
}

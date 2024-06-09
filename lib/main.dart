import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/themes/default.dart' as light;
import 'app/themes/default_dark.dart' as dark;
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "NanoPlan",
      theme: ThemeData.light().copyWith(
        colorScheme: light.colorScheme,
        textTheme: GoogleFonts.nunitoTextTheme(),
        canvasColor: light.colorScheme.onSurface,
        scaffoldBackgroundColor: light.backgroundColor,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: dark.colorScheme,
        textTheme: GoogleFonts.nunitoTextTheme(),
        canvasColor: dark.colorScheme.onSurface,
        scaffoldBackgroundColor: dark.backgroundColor,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

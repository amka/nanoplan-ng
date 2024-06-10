import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/providers/app_state.dart';
import 'app/data/providers/auth_provider.dart';
import 'app/data/providers/project_provider.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/default.dart' as light;
import 'app/themes/default_dark.dart' as dark;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

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
        primaryColor: dark.primaryColor,
        canvasColor: dark.colorScheme.onSurface,
        scaffoldBackgroundColor: dark.backgroundColor,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await GetStorage.init();
  final appState = AppState();
  Get.put(appState);
  Get.put(AuthProvider());
  Get.put(ProjectProvider());
}

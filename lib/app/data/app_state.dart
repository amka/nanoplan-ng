import 'dart:developer';

import 'package:get/get.dart';

class AppState extends GetXState {
  RxBool isDarkMode = false.obs;

  final isOnline = true.obs;

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }

  void setOnline(bool state) {
    log('Is Online set to: ${isOnline.value}');
    isOnline.value = state;
  }
}

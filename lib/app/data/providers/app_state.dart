import 'dart:developer';

import 'package:get/get.dart';
import 'package:nanoplan/app/data/models/user.dart';

class AppState extends GetXState {
  RxBool isDarkMode = false.obs;

  final isOnline = true.obs;
  final currentUser = Rx<User?>(null);

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }

  void setOnline(bool state) {
    log('Is Online set to: ${isOnline.value}');
    isOnline.value = state;
  }

  void setCurrentUser(User user) {
    currentUser.value = user;
  }
}

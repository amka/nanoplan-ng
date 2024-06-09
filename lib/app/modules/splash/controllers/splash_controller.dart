import 'dart:developer';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  onSignInPressed() {
    log('Login pressed');
  }

  void goToSignUp() {
    Get.offAllNamed(Routes.SIGNUP);
  }
}

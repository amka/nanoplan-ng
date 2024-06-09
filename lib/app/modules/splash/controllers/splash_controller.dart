import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void goToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  void onSignIn() {

  }

  void goToSignUp() {
    Get.offAllNamed(Routes.SIGNUP);
  }
}

import 'package:get/get.dart';

import '../../../data/providers/auth_provider.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  AuthProvider authProvider = Get.find();

  final loading = false.obs;

  get authMethods => authProvider.authProviders;
  get emailPassword => authProvider.emailPassword;

  @override
  void onReady() {
    super.onReady();
    if (authProvider.isAuthenticated) {
      goToHome();
    }
  }

  Future<void> fetchAuthMethods() async {
    await authProvider.fetchAuthMethods();
  }

  void goToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> onSignIn(String provider) async {
    Get.toNamed(Routes.SIGNIN);
  }

  void goToSignUp() {
    Get.toNamed(Routes.SIGNUP);
  }
}

import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/providers/auth_provider.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  AuthProvider authProvider = Get.find();

  final loading = true.obs;

  get authMethods => authProvider.authProviders;
  get emailPassword => authProvider.emailPassword;

  @override
  Future<void> onReady() async {
    super.onReady();

    if (authProvider.isAuthenticated) {
      try {
        final user = await authProvider.fetchUser();
        if (user != null) goToHome();
      } catch (e) {
        log('Failed to fetch user: $e');
      } finally {
        loading.value = false;
      }
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

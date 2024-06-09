import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../data/providers/auth_provider.dart';

class SigninController extends GetxController {
  final AuthProvider authProvider;

  final passwordVisible = false.obs;
  final nameController = TextEditingController();
  final passController = TextEditingController();

  final loading = false.obs;

  SigninController({
    required this.authProvider,
  });

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    passController.dispose();
  }

  void togglePassVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  Future signIn() async {
    if (nameController.text.isEmpty || passController.text.isEmpty) return;

    try {
      loading.value = true;
      await authProvider.authWithPassword(nameController.text, passController.text);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      log('Failed to authenticate: $e');
      Get.snackbar('Error', 'Failed to authenticate: $e');
    } finally {
      loading.value = false;
    }
  }
}

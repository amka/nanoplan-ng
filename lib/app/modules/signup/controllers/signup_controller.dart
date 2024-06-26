import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../routes/app_pages.dart';
import '../../../data/providers/auth_provider.dart';

class SignupController extends GetxController {
  final AuthProvider authProvider;

  final passwordVisible = false.obs;
  final nameController = TextEditingController();
  final passController = TextEditingController();

  final loading = false.obs;

  SignupController({
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

  Future signUp() async {
    if (nameController.text.isEmpty || passController.text.isEmpty) return;

    try {
      loading.value = true;
      await authProvider.registerWithPassword(nameController.text, passController.text);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      final err = e as ClientException;
      log('Failed to sign up: $err');
      Get.snackbar('Error', 'Failed to sign up: ${err.response['message']}');
    } finally {
      loading.value = false;
    }
  }
}

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../widgets/button.dart';
import '../../../widgets/constrained.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Constrained(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 8, left: 8, right: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'Nanoplan'.tr,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Welcome back'.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Constrained(
                  child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Email'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.1),
                    ),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                  ),
                ),
                const SizedBox(height: 32),
                Constrained(
                  child: Obx(
                    () => TextField(
                      controller: controller.passController,
                      obscureText: !controller.passwordVisible.value,
                      decoration: InputDecoration(
                        labelText: 'Password'.tr,
                        suffixIcon: GestureDetector(
                          onTap: controller.togglePassVisibility,
                          child: Icon(controller.passwordVisible.value
                              ? BootstrapIcons.eye_slash
                              : BootstrapIcons.eye),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.1),
                      ),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Constrained(
                  child: Obx(
                    () => Button(
                      onPressed: controller.signIn,
                      loading: controller.loading.value,
                      title: 'Sign In'.tr,
                      variant: ButtonVariant.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

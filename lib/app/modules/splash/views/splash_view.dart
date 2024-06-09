import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../widgets/button.dart';
import '../../../widgets/constrained.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDay = DateTime.now().hour > 6 && DateTime.now().hour < 18;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/welcome-${isDay ? 'day' : 'night'}.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 48, bottom: 24),
                  //   child: Text(
                  //     'NanoPlan'.tr,
                  //     style: GoogleFonts.ibmPlexSans(
                  //       color: isDay ? Colors.black : Colors.white,
                  //       fontSize: 64,
                  //     ),
                  //   ),
                  // ),
                  const Spacer(),
                  Card(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Column(
                        children: [
                          Constrained(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 8, left: 8, right: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GradientText(
                                'Nanoplan'.tr,
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          if (controller.emailPassword.value)
                            Constrained(
                              padding: const EdgeInsets.all(8.0),
                              child: Button(
                                onPressed: controller.goToHome,
                                title: 'Get Started'.tr,
                                variant: ButtonVariant.primary,
                              ),
                            ),
                          Constrained(
                            padding: const EdgeInsets.all(8.0),
                            child: Button(
                              onPressed: () => controller.onSignIn('yandex'),
                              icon: BootstrapIcons.person_fill,
                              title: 'Sign In'.tr,
                              variant: ButtonVariant.accent,
                            ),
                          ),
                          // Don't have an account? Create one
                          Constrained(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Don\'t have an account?'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextButton(
                                    onPressed: controller.goToSignUp,
                                    child: Text('Create one'.tr),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

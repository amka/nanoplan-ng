import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/button.dart';
import '../../../widgets/constrained.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Constrained(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Weave Your Time, Design Your World'.tr,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Constrained(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onPressed: controller.onSignInPressed,
                  title: 'Get Started'.tr,
                  variant: ButtonVariant.primary,
                ),
              ),
              Constrained(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onPressed: controller.onSignInPressed,
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: controller.goToSignUp,
                        child: Text('Create one'.tr),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

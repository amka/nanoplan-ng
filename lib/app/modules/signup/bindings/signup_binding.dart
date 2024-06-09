import 'package:get/get.dart';
import 'package:nanoplan/app/data/providers/auth_provider.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  final AuthProvider authProvider = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(authProvider: authProvider),
    );
  }
}

import 'package:get/get.dart';

import '../../../data/providers/auth_provider.dart';
import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  final AuthProvider authProvider = Get.find();
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
      () => SigninController(authProvider: authProvider),
    );
  }
}

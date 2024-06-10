import 'package:get/get.dart';

import '../../../data/providers/app_state.dart';
import '../../../data/providers/auth_provider.dart';
import '../../../data/providers/project_provider.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  final AppState appState = Get.find();
  final AuthProvider authProvider = Get.find();
  final ProjectProvider projectProvider = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        appState: appState,
        authProvider: authProvider,
        projectProvider: projectProvider,
      ),
    );
  }
}

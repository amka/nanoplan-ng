import 'package:get/get.dart';

import '../../../data/models/project.dart';
import '../../../data/providers/app_state.dart';
import '../../../data/providers/auth_provider.dart';
import '../../../data/providers/project_provider.dart';

class HomeController extends GetxController {
  final AppState appState;
  final AuthProvider authProvider;
  final ProjectProvider projectProvider;

  final projects = <Project>[].obs;

  HomeController({
    required this.appState,
    required this.authProvider,
    required this.projectProvider,
  });

  @override
  Future<void> onReady() async {
    super.onReady();

    projects.addAll(await projectProvider.fetchProjects());
  }
}

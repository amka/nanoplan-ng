import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../app_config.dart';
import 'app_state.dart';

class PocketbaseProvider extends GetxService {
  late PocketBase pb;
  final AppState appState;

  PocketbaseProvider({required this.appState});

  Future<PocketbaseProvider> init() async {
    pb = PocketBase(AppConfig.baseUrl);

    try {
      final health = await pb.health.check();
      appState.setOnline(health.code == 200);
    } catch (e) {
      appState.setOnline(false);
    }

    return this;
  }
}

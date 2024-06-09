import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../app_config.dart';
import 'app_state.dart';

class PocketbaseProvider extends GetxService {
  late PocketBase pb;
  final AppState appState;

  PocketbaseProvider({required this.appState}) {
    pb = PocketBase(AppConfig.baseUrl);

  }
}

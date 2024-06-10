import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../app_config.dart';
import 'app_state.dart';

class PocketbaseProvider extends GetxService {
  late PocketBase pb;
  final AppState appState = Get.find();
  late final AsyncAuthStore authStore;
  late final GetStorage _box;

  PocketbaseProvider() {
    _box = GetStorage();
    authStore = AsyncAuthStore(
      save: (String data) async => await _box.write('pb_auth', data),
      initial: _box.read<String>('pb_auth'),
    );
    log('authStore: ${_box.read<String>('pb_auth')}');

    pb = PocketBase(AppConfig.baseUrl, authStore: authStore);
  }
}

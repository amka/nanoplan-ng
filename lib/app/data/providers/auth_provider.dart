import 'package:get/get.dart';

import '../models/user.dart';
import 'pocketbase_provider.dart';
import '../models/auth_provider.dart' as auth_models;

class AuthProvider extends PocketbaseProvider {
  AuthProvider({required super.appState});

  final emailPassword = true.obs;
  final authProviders = <auth_models.AuthProvider>[].obs;

  get isAuthenticated => pb.authStore.isValid;

  Future<void> fetchAuthMethods() async {
    if (initialized) return;

    final result = await pb.collection('users').listAuthMethods();

    emailPassword.value = result.emailPassword;
    authProviders.clear();
    for (final auth in result.authProviders) {
      authProviders.add(auth_models.AuthProvider.fromJson(auth.toJson()));
    }
  }

  Future<User> fetchUser(String userId) async {
    final record = await pb.collection('users').getOne(userId);
    final user = User.fromRecord(record);
    appState.setCurrentUser(user);
    return user;
  }

  Future<User> authWithPassword(String email, String password) async {
    final authData =
        await pb.collection('users').authWithPassword(email, password);
    return await fetchUser(authData.record!.id);
  }

  Future<User> registerWithPassword(String email, String password) async {
    // example create body
    final body = <String, dynamic>{
      "email": email,
      "emailVisibility": true,
      "password": password,
      "passwordConfirm": password,
    };

    await pb.collection('users').create(body: body);

    // (optional) send an email verification request
    // await pb.collection('users').requestVerification(email);

    return await authWithPassword(email, password);
  }
}

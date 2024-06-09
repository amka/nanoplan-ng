import 'dart:convert';

import 'auth_provider.dart';

class AuthMethods {
    bool usernamePassword;
    bool emailPassword;
    List<AuthProvider> authProviders;

    AuthMethods({
        required this.usernamePassword,
        required this.emailPassword,
        required this.authProviders,
    });

    factory AuthMethods.fromRawJson(String str) => AuthMethods.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthMethods.fromJson(Map<String, dynamic> json) => AuthMethods(
        usernamePassword: json["usernamePassword"],
        emailPassword: json["emailPassword"],
        authProviders: List<AuthProvider>.from(json["authProviders"].map((x) => AuthProvider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "usernamePassword": usernamePassword,
        "emailPassword": emailPassword,
        "authProviders": List<dynamic>.from(authProviders.map((x) => x.toJson())),
    };
}

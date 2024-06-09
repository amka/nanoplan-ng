import 'dart:convert';

class AuthProvider {
    String name;
    String state;
    String codeVerifier;
    String codeChallenge;
    String codeChallengeMethod;
    String authUrl;

    AuthProvider({
        required this.name,
        required this.state,
        required this.codeVerifier,
        required this.codeChallenge,
        required this.codeChallengeMethod,
        required this.authUrl,
    });

    factory AuthProvider.fromRawJson(String str) => AuthProvider.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthProvider.fromJson(Map<String, dynamic> json) => AuthProvider(
        name: json["name"],
        state: json["state"],
        codeVerifier: json["codeVerifier"],
        codeChallenge: json["codeChallenge"],
        codeChallengeMethod: json["codeChallengeMethod"],
        authUrl: json["authUrl"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "state": state,
        "codeVerifier": codeVerifier,
        "codeChallenge": codeChallenge,
        "codeChallengeMethod": codeChallengeMethod,
        "authUrl": authUrl,
    };
}

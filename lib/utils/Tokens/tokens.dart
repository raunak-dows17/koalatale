import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenDetails {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await storage.read(key: "kt_token");
  }

  Future<void> setToken(String token) async {
    return await storage.write(key: "kt_token", value: token);
  }

  Future removeToken() async {
    return await storage.delete(key: "kt_token");
  }

  Future<bool> hasToken() async {
    if (await getToken() == null) {
      return false;
    } else {
      return true;
    }
  }
}

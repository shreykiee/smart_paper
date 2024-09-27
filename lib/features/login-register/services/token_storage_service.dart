// lib/services/token_storage_service.dart

import 'package:hive/hive.dart';

class TokenStorageService {
  static const String _boxName = 'authBox';
  static const String _tokenKey = 'jwtToken';

  // Save the token
  Future<void> saveToken(String token) async {
    final box = Hive.box(_boxName);
    await box.put(_tokenKey, token);
    print('Token saved successfully.');
  }

  // Retrieve the token
  String? getToken() {
    final box = Hive.box(_boxName);
    return box.get(_tokenKey);
  }

  // Delete the token
  Future<void> deleteToken() async {
    final box = Hive.box(_boxName);
    await box.delete(_tokenKey);
    print('Token deleted successfully.');
  }
}

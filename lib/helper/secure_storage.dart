import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage= const FlutterSecureStorage();
  final String emailKey = 'email';
  final String passwordKey = 'password';

  void writeData(String key, String value) async{
    await _storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async{
    return await _storage.read(key: key);
  }

  void deleteData(String key) async{
    await _storage.delete(key: key);
  }
}
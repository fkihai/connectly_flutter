import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // one instance for all app
  static final SecureStorage _instance = SecureStorage._internal();
  factory SecureStorage() => _instance;
  SecureStorage._internal();

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  WebOptions _getWebOptions() => WebOptions(
    dbName: 'ConnectlyEncryptedStorage',
    publicKey: 'ConnectlySecureStorage',
  );

  Future<void> save({required String key, required dynamic value}) async {
    await _storage.write(key: key, value: value, webOptions: _getWebOptions());
  }

  Future<dynamic> read({required String key}) async {
    final value = await _storage.read(key: key, webOptions: _getWebOptions());
    return value;
  }
}

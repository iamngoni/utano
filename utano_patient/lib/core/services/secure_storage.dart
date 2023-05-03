import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../configs/logger.dart';

class SecureStorageService {
  static SecureStorageService? _instance;
  static FlutterSecureStorage? _storage;

  static Future<SecureStorageService> getInstance() async {
    _instance ??= SecureStorageService();

    _storage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    return _instance!;
  }

  Future<void> saveToDisk(String key, String content) async {
    logger.info('key: $key value: $content', source: 'secure_storage');
    await _storage!.write(key: key, value: content);
  }

  Future<String?> getFromDisk(String key) async {
    final value = await _storage!.read(key: key);
    logger.info('key: $key value: $value', source: 'secure_storage');
    return value;
  }

  Future<void> removeFromDisk(String key) async {
    await _storage!.delete(key: key);
    logger.info('Removed $key from secure storage');
  }

  Future<void> clearDisk() async {
    await _storage!.deleteAll();
    logger.info('Cleared secure storage');
  }
}

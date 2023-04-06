//
//  secure_storage
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../configs/configs.dart';

class SecureStorageService {
  static SecureStorageService? _instance;
  static FlutterSecureStorage? _storage;

  static Future<SecureStorageService> getInstance() async {
    _instance ??= SecureStorageService();

    _storage ??= const FlutterSecureStorage();

    return _instance!;
  }

  Future<void> saveToDisk(String key, String content) async {
    logger.info(
      'key: $key value: $content',
    );
    await _storage!.write(key: key, value: content);
  }

  Future<String?> getFromDisk(String key) async {
    final value = await _storage!.read(key: key);
    logger.info(
      'key: $key value: $value',
    );
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

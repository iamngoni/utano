import 'dart:convert';
import 'dart:developer';

import 'package:encrypt/encrypt.dart';

import '../configs/api.dart';

Map<String, dynamic>? decrypt(String encrypted) {
  try {
    log('Decrypting payload');
    final Key key = Key.fromUtf8(ApiConfig.encryptionKey);
    final IV iv = IV.fromLength(16);
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.ecb));
    final String decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encrypted), iv: iv);
    return json.decode(decrypted) as Map<String, dynamic>;
  } catch (e) {
    return null;
  }
}

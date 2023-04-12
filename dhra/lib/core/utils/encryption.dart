//
//  encryption
//  dhra
//
//  Created by Ngonidzashe Mangudya on 13/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:convert';

import 'package:encrypt/encrypt.dart';

import '../configs/api.dart';
import '../configs/configs.dart';

Map<String, dynamic>? decrypt(String encrypted) {
  try {
    logger.d('Decrypting payload');
    final Key key = Key.fromUtf8(ApiConfig.encryptionKey);
    final IV iv = IV.fromLength(16);
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.ecb));
    final String decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encrypted), iv: iv);
    logger.d(json.decode(decrypted));
    return json.decode(decrypted) as Map<String, dynamic>;
  } catch (e) {
    return null;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as e;

import 'package:flutter/foundation.dart';
import 'package:pwallet/constants.dart';

class Encrypter {
  static final _iv = e.IV.fromLength(16);
  static String generateSHA512(String text) {
    var hash = '';
    hash = sha512.convert(utf8.encode(text)).toString();
    if (kDebugMode) {
      print('Hashed text: $hash');
    }
    return hash;
  }

  static String encryptPassword(String password, String salt) {
    final key = e.Key.fromUtf8(salt);

    final encrypter = e.Encrypter(e.AES(key));
    return encrypter.encrypt(password, iv: _iv).base64;
  }

  static String decryptPassword(String hash, String salt) {
    final e.Encrypted encrypted = e.Encrypted.from64(hash);
    final key = e.Key.fromUtf8(salt);

    final encrypter = e.Encrypter(e.AES(key));
    return encrypter.decrypt(encrypted, iv: _iv);
  }

  static String generateHMAC(String text, String key) {
    String hash;

    final hmac = Hmac(sha512, utf8.encode(key));
    final digest = hmac.convert(utf8.encode(text));
    hash = digest.toString();
    print('hmac is $hash');
    return hash;
  }

  static String getRandomString(int length) {
    final rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }
}

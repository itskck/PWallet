import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:pwallet/constants.dart';

class Encrypter {
  static String generateSHA512(String text) {
    var hash = '';
    hash = sha512.convert(utf8.encode(text)).toString();
    if (kDebugMode) {
      print('Hashed text: $hash');
    }
    return hash;
  }

  static void decryptFromSHA512(String hash, String salt) {}

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

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

  // static String generateHMAC(String text) {
  //   Hash hash;
  //   hash = sha512.convert(utf8.encode(text));
  //   final Hmac hmac = Hmac(hash, 'key');
  //   return hash;
  // }

  static String getRandomString(int length) {
    final Random rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';

class Encrypter {
  static String generateSHA512(String text) {
    var md = '';
    md = sha512.convert(utf8.encode(text)).toString();

    print('Hashed text: $md');
    return md;
  }
}

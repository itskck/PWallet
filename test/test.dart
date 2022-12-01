import 'package:pwallet/utils/encrypter.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import 'mock_user_cubit.dart';

void main() {
  //final userCubit = MockUserCubit();

  group('True if salt length is correct', () {
    final params = {
      0: 0,
      99: 99,
      2: 2,
      555: 555,
      120: 120,
    };

    // ignore: cascade_invocations
    params.forEach((element, expected) {
      test('$element => $expected', () {
        expect(Encrypter.getRandomString(element).length, expected);
      });
    });
  });

  group('True if password is encrypted and decrypted correctly', () {
    final params = {
      '12323': '12323',
      'żółćĄĄĄĄ': 'żółćĄĄĄĄ',
      '😋': '😋',
      'xXxDxDXDXDXDdddXDxdDD': 'xXxDxDXDXDXDdddXDxdDD',
      ' ': ' ',
    };

    // ignore: cascade_invocations
    params.forEach((element, expected) {
      test('$element => $expected', () {
        final String salt = Encrypter.getRandomString(32);
        final encrypted = Encrypter.encryptPassword(element, salt);
        expect(element, Encrypter.decryptPassword(encrypted, salt));
      });
    });
  });

  group('True if password is encrypted and decrypted correctly', () {
    final params = {
      '12323': '12323',
      'żółćĄĄĄĄ': 'żółćĄĄĄĄ',
      '😋': '😋',
      'xXxDxDXDXDXDdddXDxdDD': 'xXxDxDXDXDXDdddXDxdDD',
      ' ': ' ',
    };

    // ignore: cascade_invocations
    params.forEach((element, expected) {
      test('$element => $expected', () {
        final String salt = Encrypter.getRandomString(32);
        final encrypted = Encrypter.encryptPassword(element, salt);
        expect(element, Encrypter.decryptPassword(encrypted, salt));
      });
    });
  });

  group('True if sha512 length is 128', () {
    final params = [
      '12323',
      'żółćĄĄĄĄ',
      '😋',
      'xXxDxDXDXDXDdddXDxdDD',
      ' ',
    ];

    // ignore: cascade_invocations
    params.forEach((element) {
      test('$element => length = 128', () {
        expect(Encrypter.generateSHA512(element).length, 128);
      });
    });
  });

  group('True if hmac length is 128', () {
    final params = [
      '12323',
      'żółćĄĄĄĄ',
      '😋',
      'xXxDxDXDXDXDdddXDxdDD',
      ' ',
    ];

    // ignore: cascade_invocations
    params.forEach((element) {
      test('$element => hashed length = 128', () {
        final String salt = Encrypter.getRandomString(32);
        expect(Encrypter.generateHMAC(element, salt).length, 128);
      });
    });
  });
}

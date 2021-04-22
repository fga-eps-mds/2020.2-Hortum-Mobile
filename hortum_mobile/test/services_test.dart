import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/services/codec_string.dart';

main() {
  String str = 'Teste';
  String strCoded = 'dGVzdGU=';

  test('Testing the encode of a string to base64 string', () {
    encodeString(str);

    expect(strCoded, 'dGVzdGU=');
  });
  test('Testing the decode of a string base64 to string', () {
    decodeString(strCoded);

    expect(str, 'Teste');
  });
}

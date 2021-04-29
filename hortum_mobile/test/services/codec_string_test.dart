import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/services/codec_string.dart';

main() {
  test('Testing the encode of a string to base64 string', () {
    String result = encodeString('Teste');

    expect(result, 'VGVzdGU=');
  });
  test('Testing the decode of a string base64 to string', () {
    String result = decodeString('VGVzdGU=');

    expect(result, 'Teste');
  });
}

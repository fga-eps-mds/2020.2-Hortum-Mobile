import 'dart:convert';

String encodeString(String str) {
  var strInt = utf8.encode(str);
  return base64.encode(strInt);
}

String decodeString(String str) {
  var strInt = base64.decode(str);
  return utf8.decode(strInt);
}

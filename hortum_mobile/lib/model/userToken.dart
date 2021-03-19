import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserToken {
  String tokenRefresh;
  String tokenAccess;
  final _storage = new FlutterSecureStorage();

  UserToken({this.tokenRefresh, this.tokenAccess});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
        tokenRefresh: json['refresh'], tokenAccess: json['access']);
  }

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}

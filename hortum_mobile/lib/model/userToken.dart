import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserToken {
  String tokenRefresh;
  String tokenAccess;
  String userEmail;
  final _storage = new FlutterSecureStorage();

  UserToken();

  factory UserToken.fromJson(Map<String, dynamic> json) {
    UserToken userToken = new UserToken();
    userToken.tokenRefresh = json['refresh'];
    userToken.tokenAccess = json['access'];
    return userToken;
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

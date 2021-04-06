import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
  String tokenRefresh;
  String tokenAccess;
  String email;
  String username;
  String password;
  bool isProductor;
  final _storage = new FlutterSecureStorage();

  User(
      {this.tokenRefresh,
      this.tokenAccess,
      this.email,
      this.username,
      this.password,
      this.isProductor});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        tokenRefresh: json['refresh'],
        tokenAccess: json['access'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        isProductor: json['is_productor']);
  }

  void deleteUser() {
    deleteSecureData('token_refresh');
    deleteSecureData('token_access');
    deleteSecureData('email');
    tokenAccess = null;
    tokenRefresh = null;
    email = null;
    username = null;
    password = null;
    isProductor = null;
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

  @override
  bool operator ==(other) {
    return (other is User) &&
        other.tokenRefresh == tokenRefresh &&
        other.tokenAccess == tokenAccess &&
        other.email == email &&
        other.username == username &&
        other.password == password &&
        other.isProductor == isProductor;
  }
}

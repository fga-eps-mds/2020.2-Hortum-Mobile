import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
  String tokenRefresh;
  String tokenAccess;
  String email;
  String username;
  String password;
  bool isProductor;
  String phone_number;
  final _storage = new FlutterSecureStorage();

  User(
      {this.tokenRefresh,
      this.tokenAccess,
      this.email,
      this.username,
      this.password,
      this.isProductor,
      this.phone_number});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        tokenRefresh: json['refresh'],
        tokenAccess: json['access'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        isProductor: json['is_productor'],
        phone_number: json['phone_number']);
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
    phone_number = null;
  }

  void updateToken(String newToken) {
    writeSecureData('token_access', newToken);
    this.tokenAccess = newToken;
  }

  void initAutoLogin(bool isProductor, String username) async {
    this.isProductor = isProductor;
    this.username = username;
    this.email = await this.readSecureData('email');
    this.tokenAccess = await this.readSecureData('token_access');
    this.phone_number = await this.readSecureData('phone_number');
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
        other.isProductor == isProductor &&
        other.phone_number == phone_number;
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hortum_mobile/globals.dart';

class User {
  String tokenRefresh;
  String tokenAccess;
  String email;
  String username;
  String password;
  bool isProductor;
  String profile_picture;
  String phone_number;
  final _storage = new FlutterSecureStorage();

  User(
      {this.tokenRefresh,
      this.tokenAccess,
      this.email,
      this.username,
      this.password,
      this.isProductor,
      this.profile_picture,
      this.phone_number});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        tokenRefresh: json['refresh'],
        tokenAccess: json['access'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        profile_picture: "$ip" + json['profile_picture'],
        phone_number: json['phone_number'],
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
    profile_picture = null;
    phone_number = null;
  }

  void updateToken(String newToken) {
    writeSecureData('token_access', newToken);
    this.tokenAccess = newToken;
  }

  void initAutoLogin(bool isProductor, String username) async {
    this.isProductor = isProductor;
    this.username = username;
    this.profile_picture = profile_picture;
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

import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/model/user.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  User user;
  setUp(() {
    user = User(
        email: "emailteste@email.com",
        isProductor: true,
        password: "Senha123",
        username: "Usuário Teste",
        tokenAccess: "TokendeAcesso",
        tokenRefresh: "TokendeRefresh");
  });

  test('Given a json create a user', () {
    Map<String, dynamic> json = Map();
    json['is_productor'] = true;
    json['email'] = "emailteste@email.com";
    json['username'] = "Usuário Teste";
    json['password'] = "Senha123";
    json['refresh'] = "TokendeRefresh";
    json['access'] = "TokendeAcesso";
    User result = User.fromJson(json);
    expect(result, user);
  });

  test('Given an user delete his info', () {
    user.deleteUser();
    expect(user.username, null);
    expect(user.password, null);
    expect(user.email, null);
    expect(user.isProductor, null);
    expect(user.tokenAccess, null);
    expect(user.tokenRefresh, null);
  });

  test('Testing method updateToken from User model', () {
    user.updateToken('tokenAcesso');
    expect(user.tokenAccess, 'tokenAcesso');
  });

  test('Testing initAutoLogin method', () {
    user.email = 'consumidor@email.com';
    user.tokenAccess = 'tokenAcesso';
    user.initAutoLogin(false, 'Consumidor');
    expect(user.isProductor, false);
    expect(user.username, 'Consumidor');
    expect(user.email, 'consumidor@email.com');
    expect(user.tokenAccess, 'tokenAcesso');
  });
}

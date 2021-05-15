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
        phone_number: "12345678910",
        profile_picture: "http://localhost:8000/images/perfil.jpg",
        tokenRefresh: "TokendeRefresh");
  });

  test('Given a json create a user', () {
    Map<String, dynamic> json = Map();
    json['is_productor'] = true;
    json['email'] = "emailteste@email.com";
    json['username'] = "Usuário Teste";
    json['password'] = "Senha123";
    json['profile_picture'] = "http://localhost:8000/images/perfil.jpg";
    json['refresh'] = "TokendeRefresh";
    json['access'] = "TokendeAcesso";
    json['phone_number'] = "12345678910";
    User result = User.fromJson(json);
    expect(result, user);
  });

  test('Testing initAutoLogin method', () {
    user.email = 'consumidor@email.com';
    user.tokenAccess = 'tokenAcesso';
    user.phone_number = '12345678910';
    user.initAutoLogin(false, 'Consumidor');
    expect(user.isProductor, false);
    expect(user.username, 'Consumidor');
    expect(user.email, 'consumidor@email.com');
    expect(user.tokenAccess, 'tokenAcesso');
    expect(user.phone_number, '12345678910');
  });
}

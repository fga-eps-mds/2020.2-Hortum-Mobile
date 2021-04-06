import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_validation.dart';

void main() {
  group('Name Validator', () {
    test('Given an empty Name return error', () {
      String result = FormValidation.validateName('');
      expect(result, 'Informe o nome');
    });

    test('Given an invalid name return error', () {
      String result = FormValidation.validateName('Jo@ozinho Silva');
      expect(result, 'O nome deve conter caracteres de a-z ou A-Z');
    });

    test('Given an non empty Name return null', () {
      String result = FormValidation.validateName('Joãozinho Silva');
      expect(result, null);
    });
  });

  group('Email Validator', () {
    test('Given an empty Email return error', () {
      String result = FormValidation.validateEmail('');
      expect(result, 'Informe o email');
    });

    test('Given an invalid email return error', () {
      String result = FormValidation.validateEmail('emailteste.com');
      expect(result, 'Email inválido');
    });

    test('Given an non empty Email return null', () {
      String result = FormValidation.validateEmail('emailteste@email.com');
      expect(result, null);
    });
  });

  group('Password Validator', () {
    test('Given an empty password return error', () {
      String result = FormValidation.validatePassword('');
      expect(result, 'O campo é obrigatório');
    });

    test('Given a big password return error', () {
      String result =
          FormValidation.validatePassword('testedesenha1234testedesenha1234');
      expect(result, 'A senha deve conter menos de 30 dígitos');
    });

    test('Given a valid password return null', () {
      String result = FormValidation.validatePassword('testedesenha1234');
      expect(result, null);
    });
  });
}

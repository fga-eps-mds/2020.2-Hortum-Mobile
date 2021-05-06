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

  group('Confirm Password Validator', () {
    test('Given an empty value return an error', () {
      String result = FormValidation.validateConfirmPassword('12345', '');
      expect(result, "O campo é obrigatório");
    });

    test(
        'Given a different value between password and confirmPassword return an error',
        () {
      String result =
          FormValidation.validateConfirmPassword('Teste1234', 'teste1234');
      expect(result, 'A senha deve ser igual');
    });

    test(
        'Given the correct value for both: password and confirmPassword return null',
        () {
      String result =
          FormValidation.validateConfirmPassword('Teste1234', 'Teste1234');
      expect(result, null);
    });
  });
  group('Phone Validator', () {
    test('Given an empty phone number return error', () {
      String result = FormValidation.validatePhone('');
      expect(result, 'Informe o celular');
    });

    test('Given an invalid phone number return error', () {
      String result = FormValidation.validatePhone('123456789');
      expect(result, 'O celular deve ter 11 dígitos');
    });
    test('Given an non empty and with symbols phone number return null', () {
      String result = FormValidation.validatePhone('sadossewsdw');
      expect(result, 'O número do celular só deve conter dígitos');
    });
    test('Given an non empty and valid phone number return null', () {
      String result = FormValidation.validatePhone('12345678910');
      expect(result, null);
    });
  });
  group('Validate Title', () {
    test('Given an empty title return an error', () {
      String result = FormValidation.validateTitle('');
      expect(result, 'Informe o título do anúncio');
    });

    test('Given an invalid title return an error', () {
      String result = FormValidation.validateTitle('12 B@n@n@s');
      expect(result, 'Título inválido');
    });

    test('Given a non empty title return null', () {
      String result = FormValidation.validateTitle('12 Bananas');
      expect(result, null);
    });
  });

  group('Validate Price', () {
    test('Given an empty value return an error', () {
      String result = FormValidation.validatePrice('');
      expect(result, 'Informe o preço');
    });

    test('Given an invalid value return an error', () {
      String result = FormValidation.validatePrice('15,00');
      expect(result, 'Preço inválido');
    });

    test('Given an non empty valid value return null', () {
      String result = FormValidation.validatePrice('15.00');
      expect(result, null);
    });
  });

  group('Validate Category', () {
    test('Given an empty value return an error', () {
      String result = FormValidation.validateCategory(null);
      expect(result, 'Informe a categoria do produto');
    });

    test('Given a valid choice for category return null', () {
      String result = FormValidation.validateCategory('Banana');
      expect(result, null);
    });
  });

  group('Validate Description', () {
    test('Given an empty value return an error', () {
      String result = FormValidation.validateAnnounDescription('');
      expect(result, 'Informe uma descrição para o produto');
    });

    test('Given a big description for the product return an error', () {
      String description = """
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsumss""";

      String result = FormValidation.validateAnnounDescription(description);
      expect(result, 'A descrição deve conter no máximo 200 caracteres');
    });

    test('Given a non empty description with length smaller than 200', () {
      String description =
          "Descrição do produto que será vendido amanhã na 400";
      String result = FormValidation.validateDescription(description);

      expect(result, null);
    });
  });

  group('Validate Localization', () {
    test('Given an empty value return an error', () {
      String result = FormValidation.validateLocalization('');
      expect(result, 'Informe a localização');
    });
  });
}

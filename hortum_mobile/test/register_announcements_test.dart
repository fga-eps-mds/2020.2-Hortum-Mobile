import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

main() {
  group('Validate Title', () {
    test('Given an empty title return an error', () {
      String result = AnnouncementsFormValidation.validateTitle('');
      expect(result, 'Informe o título do anúncio');
    });

    test('Given an invalid title return an error', () {
      String result = AnnouncementsFormValidation.validateTitle('12 B@n@n@s');
      expect(result, 'Título inválido');
    });

    test('Given a non empty title return null', () {
      String result = AnnouncementsFormValidation.validateTitle('12 Bananas');
      expect(result, null);
    });
  });

  group('Validate Price', () {
    test('Given an empty value return an error', () {
      String result = AnnouncementsFormValidation.validatePrice('');
      expect(result, 'Informe o preço');
    });

    test('Given an invalid value return an error', () {
      String result = AnnouncementsFormValidation.validatePrice('15,00');
      expect(result, 'Preço inválido');
    });

    test('Given an non empty valid value return null', () {
      String result = AnnouncementsFormValidation.validatePrice('15.00');
      expect(result, null);
    });
  });

  group('Validate Category', () {
    test('Given an empty value return an error', () {
      String result = AnnouncementsFormValidation.validateCategory(null);
      expect(result, 'Informe a categoria do produto');
    });

    test('Given a valid choice for category return null', () {
      String result = AnnouncementsFormValidation.validateCategory('Banana');
      expect(result, null);
    });
  });

  group('Validate Description', () {
    test('Given an empty value return an error', () {
      String result = AnnouncementsFormValidation.validateDescription('');
      expect(result, 'Informe uma descrição para o produto');
    });

    test('Given a big description for the product return an error', () {
      String description = """
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsums 
      Descrição do produto que será vendido lorem ipsumss""";

      String result =
          AnnouncementsFormValidation.validateDescription(description);
      expect(result, 'A descrição deve conter no máximo 200 caracteres');
    });

    test('Given a non empty description with length smaller than 200', () {
      String description =
          "Descrição do produto que será vendido amanhã na 400";
      String result =
          AnnouncementsFormValidation.validateDescription(description);

      expect(result, null);
    });
  });

  group('Validate Localization', () {
    test('Given an empty value return an error', () {
      String result = AnnouncementsFormValidation.validateLocalization('');
      expect(result, 'Informe a localização');
    });

    test('Given a valid value return null', () {
      String result =
          AnnouncementsFormValidation.validateLocalization('Asa Norte 404');
      expect(result, null);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';

main() {
  test('Testing the method manipulateData on ProdLoggedAnnounDataApi', () {
    ProdLoggedAnnounDataApi announProd = ProdLoggedAnnounDataApi();
    dynamic element = {
      "username": "Usuário Teste",
      "email": "usuário@gmail.com",
      "idPicture": null,
      "announcements": [
        {
          "username": "Usuário Teste",
          "idPictureProductor": null,
          "name": "Folha Verde",
          "type_of_product": "Alface",
          "description": "Alface plantado na fazenda",
          "price": 5.0,
          "idPicture": null
        }
      ]
    };
    announProd.announcements = element['announcements'];

    announProd.manipulateData();

    expect(announProd.announcements[0]['price'], "R\$ 5,00");
    expect(announProd.announcements[0]['username'], "Usuário");
  });
}

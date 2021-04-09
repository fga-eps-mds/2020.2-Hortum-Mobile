import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';

main() {
  test('Given a list of announcements manipulate correctly the data', () {
    AnnounDataApi annouData = new AnnounDataApi();
    dynamic element = {
      "idProductor": {"username": "Usuário Teste", "idPicture": null},
      "name": "Anúncio Teste",
      "type_of_product": "Banana",
      "description": "Descrição teste",
      "price": 15.0,
      "idPicture": null
    };

    annouData.announcements.add(element);

    annouData.manipulateData();
    dynamic result = {
      "idProductor": {"username": "Usuário", "idPicture": null},
      "name": "Anúncio Teste",
      "type_of_product": "Banana",
      "description": "Descrição teste",
      "price": "R\$ 15,00",
      "idPicture": null
    };
    expect(result, annouData.announcements[0]);
  });
}

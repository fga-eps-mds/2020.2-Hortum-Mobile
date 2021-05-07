import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';

class HomeCustomerServices {
  static populateData(String type, String filter, AnnouncementsApi announData,
      ProductorsDataApi productorsData) async {
    if (type == "name") {
      await announData.getAnnoun(filter, type);
    } else if (type == "localizations__adress") {
      await announData.getAnnoun(filter, type);
    } else {
      await productorsData.getProductors(filter);
    }
  }
}

import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';

class HomeCustomerServices {
  static populateData(String type, String filter, AnnouncementsApi announData,
      ProductorsDataApi productorsData) async {
    if (type == "Announ") {
      await announData.getAnnoun(filter);
    } else if (type == "Local") {
      await announData.getAnnoun(filter);
    } else {
      await productorsData.getProductors(filter);
    }
  }
}

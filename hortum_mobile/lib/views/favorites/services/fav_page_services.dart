import 'package:hortum_mobile/data/announ_data_backend.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';

class FavPageServices {
  static populateData(bool isAnnouncements, AnnounDataApi announData,
      {ProductorsDataApi productorsData}) async {
    if (isAnnouncements) {
      await announData.getFavAnnoun();
    } else {
      await productorsData.getFavProductors();
    }
  }
}

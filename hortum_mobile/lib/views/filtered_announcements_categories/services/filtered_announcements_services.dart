import 'package:hortum_mobile/data/announcements/announcements_backend.dart';

class FilteredAnnounPageServices {
  static populateData(String filter, AnnouncementsApi announData) async {
    await announData.categoryAnnoun(filter);
  }
}

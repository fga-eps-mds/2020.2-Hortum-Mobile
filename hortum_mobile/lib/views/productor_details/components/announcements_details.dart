import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/productor_details_backend.dart';
import 'package:hortum_mobile/views/productor_details/components/announcements_tag.dart';
import 'package:hortum_mobile/views/productor_details/services/productor_details_services.dart';

class AnnouncementsDetails extends StatefulWidget {
  final ProductorsDetailsApi prodData;
  const AnnouncementsDetails({@required this.prodData, Key key})
      : super(key: key);

  @override
  _AnnouncementsDetailsState createState() => _AnnouncementsDetailsState();
}

class _AnnouncementsDetailsState extends State<AnnouncementsDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.5,
        child: ListView(
          children: [
            Column(
              children: [
                AnnouncementTag(),
                ProductorDetaislService.completeAnnouncements(
                    widget.prodData.announcements, size)
              ],
            ),
          ],
        ));
  }
}

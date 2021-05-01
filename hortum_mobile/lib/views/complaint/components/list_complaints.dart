import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/views/complaint/components/complaint_box.dart';

class ComplaintsList extends StatelessWidget {
  final ComplaintDataAPI complaintAPI;

  const ComplaintsList({@required this.complaintAPI, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List Complaints = complaintAPI.complaints;

    return Container(
      height: size.height * 0.66,
      child: Complaints.length != 0
          ? ListView.builder(
              itemCount: Complaints.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ComplaintBox(
                  author: Complaints[index]['author'],
                  description: Complaints[index]['description'],
                  image: 'assets/images/perfil.jpg',
                );
              })
          : Container(
              margin: EdgeInsets.only(top: size.height * 0.15),
              width: size.width * 0.6,
              child: Text(
                "Este produtor não possui nenhuma reclamação",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff1D8E40), fontSize: 15),
              ),
            ),
    );
  }
}

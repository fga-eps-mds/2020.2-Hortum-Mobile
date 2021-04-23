import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/reclamation_data_backend.dart';
import 'package:hortum_mobile/views/reclamation/components/reclamation_box.dart';

class ReclamationsList extends StatefulWidget {
  final ReclamationDataAPI reclamAPI;

  const ReclamationsList({@required this.reclamAPI, Key key}) : super(key: key);

  @override
  _ReclamationsListState createState() => _ReclamationsListState();
}

class _ReclamationsListState extends State<ReclamationsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List reclamations = widget.reclamAPI.reclamations;

    return Container(
      height: size.height * 0.66,
      child: reclamations.length != 0
          ? ListView.builder(
              itemCount: reclamations.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ReclamationBox(
                  author: reclamations[index]['author'],
                  description: reclamations[index]['description'],
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

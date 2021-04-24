import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/spin.dart';
import 'package:hortum_mobile/data/reclamation_data_backend.dart';
import 'package:hortum_mobile/services/codec_string.dart';

import 'components/list_reclamations.dart';
import 'components/reclamation_form.dart';

class ReclamationPage extends StatefulWidget {
  final Dio dio;
  final String emailProductor;

  const ReclamationPage({this.dio, this.emailProductor, Key key})
      : super(key: key);
  @override
  _ReclamationPageState createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = new TextEditingController();
    final TextEditingController description = new TextEditingController();
    Size size = MediaQuery.of(context).size;
    ReclamationDataAPI reclamAPI = new ReclamationDataAPI(widget.dio);

    return FutureBuilder(
      future: reclamAPI.listReclamation(emailProductor: widget.emailProductor),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: size.height * 0.03,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Color(0xffF46A6A).withOpacity(0.3),
                ),
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    top: size.height * 0.07, left: size.width * 0.05),
                child: MaterialButton(
                  key: Key('buttonArrowback'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'RECLAMAÇÕES',
                            key: Key('textReclamações'),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            height: size.height * 0.06,
                            padding: EdgeInsets.only(top: size.height * 0.005),
                            child: MaterialButton(
                              key: Key('createReclamationButton'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReclamationForm(
                                      dio: widget.dio,
                                      name: name,
                                      description: description,
                                      emailProductor:
                                          decodeString(widget.emailProductor),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: size.width * 0.3,
                                height: size.height * 0.04,
                                margin: EdgeInsets.only(
                                    top: size.height / 100,
                                    bottom: size.height / 100),
                                decoration: BoxDecoration(
                                  color: Color(0xffA7DDB7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Criar reclamação",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto-Bold',
                                          fontSize: 11)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (snapshot.connectionState == ConnectionState.done)
                      ReclamationsList(reclamAPI: reclamAPI)
                    else
                      SpinWidget(margin: size.height * 0.25),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        );
      },
    );
  }
}

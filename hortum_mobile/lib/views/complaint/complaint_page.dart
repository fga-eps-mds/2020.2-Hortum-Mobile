import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/spin.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/complaint/complaint_register_page.dart';
import 'package:hortum_mobile/views/complaint/components/arrowback_button.dart';
import 'components/list_complaints.dart';

class ComplaintPage extends StatefulWidget {
  final Dio dio;
  final String emailProductor;

  const ComplaintPage({this.dio, this.emailProductor, Key key})
      : super(key: key);
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = new TextEditingController();
    final TextEditingController description = new TextEditingController();
    Size size = MediaQuery.of(context).size;
    ComplaintDataAPI complaintDataAPI = new ComplaintDataAPI(widget.dio);

    return FutureBuilder(
      future:
          complaintDataAPI.listComplaint(emailProductor: widget.emailProductor),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: Stack(
            children: [
              ArrowBackButton(),
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
                              key: Key('createcomplaintButton'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComplaintRegisterPage(
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
                      ComplaintsList(complaintAPI: complaintDataAPI)
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

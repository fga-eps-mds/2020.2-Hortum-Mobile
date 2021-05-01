import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/spin.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/views/complaint/components/arrowback_button.dart';
import 'package:hortum_mobile/views/complaint/components/create_complaint_button.dart';
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
              CreateComplaintButton(
                dio: widget.dio,
                emailProductor: widget.emailProductor,
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
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/register_complaint/services/complaint_services.dart';

import 'components/photo_selecter_complaint.dart';

class RegisterComplaintPage extends StatefulWidget {
  final Dio dio;
  final TextEditingController name;
  final TextEditingController description;
  final String emailProductor;

  const RegisterComplaintPage(
      {this.dio, this.name, this.description, this.emailProductor, Key key})
      : super(key: key);
  @override
  _RegisterComplaintPageState createState() =>
      _RegisterComplaintPageState(name: name, description: description);
}

class _RegisterComplaintPageState extends State<RegisterComplaintPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name;
  final TextEditingController description;

  _RegisterComplaintPageState({this.name, this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          CircleStyle(
            color: Color(0xfff46a6a),
            opacity: 0.2,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: size.height * 0.025),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.01,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.085),
                          child: Text(
                            'RECLAMAÇÃO',
                            key: Key('ComplaintPage'),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          height: size.height * 0.6,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: CustomFormField(
                                    suffixIcon: false,
                                    obscureText: false,
                                    labelText: 'Seu nome',
                                    controller: name,
                                    icon: null,
                                    validator: FormValidation.validateName,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Descrição do ocorrido',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Comfortaa-Regular',
                                          letterSpacing: -0.33,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 20),
                                  child: CustomDescField(
                                    controller: description,
                                    validator:
                                        FormValidation.validateDescription,
                                  ),
                                ),
                                PhotoSelecterComplaint(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.05,
                          child: MaterialButton(
                            key: Key('enviarReclamButton'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                ComplaintServices.registerComplaint(
                                    dio: widget.dio,
                                    name: name.text,
                                    description: description.text,
                                    emailProductor: widget.emailProductor,
                                    context: context);
                              }
                            },
                            child: Container(
                              width: size.width * 0.5,
                              height: size.height * 0.04,
                              margin: EdgeInsets.only(top: size.height / 100),
                              decoration: BoxDecoration(
                                color: Color(0xfff46a6a),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("ENVIAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto-Bold')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

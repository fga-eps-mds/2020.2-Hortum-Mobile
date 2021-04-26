import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/delete_account/components/delete_user_form.dart';

class DeleteAccountPage extends StatefulWidget {
  final Dio dio;

  const DeleteAccountPage({this.dio, Key key}) : super(key: key);
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController password = new TextEditingController();
    final TextEditingController confirmPassword = new TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: Key('deleteAccountPage'),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(color: Color(0xffF46A6A), opacity: 0.2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                key: Key('deleteAccount'),
                children: [
                  Text(
                    'EXCLUIR CONTA',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Comfortaa-Regular',
                        letterSpacing: -0.33,
                        fontWeight: FontWeight.w300),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        right: size.width * 0.1,
                        left: size.width * 0.1,
                      ),
                      child: DeleteUserForm(
                          dio: widget.dio,
                          password: password,
                          confirmPassword: confirmPassword))
                ],
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

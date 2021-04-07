import 'package:flutter/material.dart';

import 'edit_page.dart';

class ButtonsRow extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _localizacao = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.edit,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditPage()));
            },
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.visibility_off,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.delete,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

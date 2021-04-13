import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final TextEditingController controller;
  const Search({@required this.controller, Key key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Color(0xff59981A)),
          hintText: "Pesquisar",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: size.height * 0.018)),
      cursorColor: Colors.black.withOpacity(0.2),
      controller: widget.controller,
      onChanged: (value) {
        super.setState(() {});
      },
    );
  }
}

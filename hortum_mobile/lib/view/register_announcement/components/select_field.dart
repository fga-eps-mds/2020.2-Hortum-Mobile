import 'package:flutter/material.dart';

class SelectFormField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final Function validator;
  const SelectFormField(
      {@required this.labelText,
      @required this.icon,
      @required this.validator,
      Key key})
      : super(key: key);
  @override
  _SelectFormFieldState createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectFormField> {
  String _currentSelectedValue = '';
  var _teste = ['fvdvss', 'vbvdb', 'fasfasf'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5)),
          prefixIcon: widget.icon,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.only(top: 2)),
      value: (_currentSelectedValue == '' ? null : _currentSelectedValue),
      isDense: true,
      validator: widget.validator,
      onChanged: (String newValue) {
        setState(() {
          _currentSelectedValue = newValue;
        });
      },
      items: _teste.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

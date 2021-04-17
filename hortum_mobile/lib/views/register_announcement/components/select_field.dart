import 'package:flutter/material.dart';

class SelectFormField extends StatefulWidget {
  final String labelText;
  final String initialValue;
  final List<String> listValues;
  final Icon icon;
  final Function validator;
  final TextEditingController controller;
  const SelectFormField(
      {@required this.labelText,
      @required this.listValues,
      @required this.icon,
      @required this.validator,
      @required this.controller,
      this.initialValue,
      Key key})
      : super(key: key);
  @override
  _SelectFormFieldState createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectFormField> {
  // ignore: unused_field
  String _currentSelectedValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5)),
          prefixIcon: widget.icon,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.only(top: 2)),
      value: (widget.initialValue == null ? null : widget.initialValue),
      isDense: true,
      validator: widget.validator,
      onChanged: (String newValue) {
        setState(() {
          _currentSelectedValue = newValue;
          widget.controller.text = newValue;
        });
      },
      items: widget.listValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

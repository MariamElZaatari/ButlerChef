import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';

class Input extends StatefulWidget {
  final String _hint;
  final Function(String) callback;
  final bool isPassword;
  final String? password;

  const Input(
      {Key? key,
      required value,
      required this.callback,
      required this.isPassword, this.password})
      : _hint = value,
        super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  var inputValue = TextEditingController();
  late String txt;

  String getText() {
    return inputValue.text;
  }

  @override
  void initState() {
    txt = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 295,
      height: 55,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Center(
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter ' + widget._hint;
            } else if (widget._hint == "Email" &&
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
              setState(() {
                txt = "Email";
              });
            } else if (widget._hint == "Password" &&
                !RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$")
                    .hasMatch(value)) {
              setState(() {
                txt = "Password";
              });
            } else if (widget._hint == "Repeat Password" && value!=widget.password) {
              setState(() {
                txt = "Password Match";
              });
            } else if (widget._hint == "First Name" &&
                !RegExp(r"^[A-Za-z]*$").hasMatch(value)) {
              setState(() {
                txt = "First Name";
              });
            } else if (widget._hint == "Last Name" &&
                !RegExp(r"^[A-Za-z]*$").hasMatch(value)) {
              setState(() {
                txt = "Last Name";
              });
            } else {
              setState(() {
                txt = "";
              });
            }
            return txt.isEmpty ? null : 'Invalid ' + txt;
          },
          obscureText: widget.isPassword ? true : false,
          controller: inputValue,
          onChanged: (text) {
            widget.callback(text);
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.green),
              ),
              hintText: widget._hint,
              hintStyle: const TextStyle(
                  color: AppColors.placeholder,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                  fontSize: 20)),
        ),
      ),
    );
  }
}

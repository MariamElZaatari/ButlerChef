import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';

class Input extends StatefulWidget {
  final String _hint;
  final Function(String) callback;
  final bool isPassword;

  const Input({Key? key, required value, required this.callback, required this.isPassword})
      : _hint = value,
        super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  var inputValue = TextEditingController();

  String getText() {
    return inputValue.text;
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
        child: TextField(
          obscureText: widget.isPassword? true:false,
          controller: inputValue,
          onChanged: (text) {
            widget.callback(text);
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              enabledBorder:
              UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.black),
              ),
              focusedBorder:
              UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.green),
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
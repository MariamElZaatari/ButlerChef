import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class Input extends StatefulWidget {
  final String _hint;
  final Function(String) callback;

  const Input({Key? key, required value, required this.callback})
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
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 295,
      height: 55,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Center(
        child: TextField(
          controller: inputValue,
          onChanged: (text) {
            widget.callback(text);
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none,
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
import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class Input extends StatelessWidget {
  final String _value;
  const Input({
    Key? key, required value
  }) : _value=value, super(key: key);

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
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: _value,
              hintStyle: const TextStyle(color: AppColors.placeholder, fontWeight: FontWeight.normal, letterSpacing: 2, fontSize: 20)
          ),
        ),
      ),
    );
  }
}
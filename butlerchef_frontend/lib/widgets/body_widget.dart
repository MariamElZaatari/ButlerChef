// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    Key? key,
    required List<Widget> widgetOptions,
    required int selectedIndex,
  })
      : _widgetOptions = widgetOptions,
        _selectedIndex = selectedIndex,
        super(key: key);

  final List<Widget> _widgetOptions;
  final int _selectedIndex;

  @override
  BodyWidgetState createState() => BodyWidgetState();
}


class BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget._selectedIndex == 0? EdgeInsets.fromLTRB(0, 30, 0, 15): EdgeInsets.fromLTRB(0, 0, 0, 15),
      child:
            Center(
              child: widget._widgetOptions.elementAt(widget._selectedIndex),
            ),

    );
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/search_bar.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required List<Widget> widgetOptions,
    required int selectedIndex,
  })  : _widgetOptions = widgetOptions,
        _selectedIndex = selectedIndex,
        super(key: key);

  final List<Widget> _widgetOptions;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _selectedIndex == 0? EdgeInsets.fromLTRB(0, 30, 0, 15): EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_selectedIndex == 0)
          SearchBar(),
          Expanded(
            flex: 9,
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}

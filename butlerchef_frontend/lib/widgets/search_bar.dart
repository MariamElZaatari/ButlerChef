import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';

class SearchBar extends StatefulWidget {
  final Function(String) callback;

  const SearchBar({
    Key? key, required this.callback,
  }) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
late final TextEditingController _controller;

void initState() {
  super.initState();
  _controller = TextEditingController(text: "");
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      height: 40,
      child: Center(
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search recipes...',
            prefixIcon: Icon(Icons.search_rounded,
                color: AppColors.green,
          ),
        ),
    controller: _controller,
    onSubmitted: (text) => widget.callback(_controller.text),
      ),
    ),
    );
  }
}
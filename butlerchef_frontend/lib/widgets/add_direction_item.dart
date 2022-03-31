import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/constants/styles.dart';
import 'package:flutter/material.dart';

class Direction extends StatefulWidget {
  const Direction({
    Key? key,
    this.title = 'Title',
    this.body =
        'Spray large skillet with cooking spray. Heat over medium-high heat until hot. Add onion and bell pepper; cook and stir 5 to 7 minutes or until onion begins to brown. Reduce heat to medium; cook 8 to 10 minutes.',
    this.editable = false,
    this.onTitleChange,
    this.onBodyChange,
  }) : super(key: key);
  final String? title;
  final String? body;
  final bool editable;
  final void Function(String title)? onTitleChange;
  final void Function(String body)? onBodyChange;

  @override
  DirectionState createState() => DirectionState();
}

class DirectionState extends State<Direction> {
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _bodyController = TextEditingController(text: widget.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.fromLTRB(15, 41, 15, 21),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20),
                        enabled: widget.editable,
                        border: InputBorder.none,
                        hintText: 'Title'),
                    onChanged: (text) => widget.onTitleChange?.call(text),
                    style: ThemeText.directionTitle,
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
            flex: 7,
            child: Align(
              alignment: Alignment.topCenter,
              child: TextField(
                controller: _bodyController,
                maxLines: 5,
                decoration: InputDecoration(
                  enabled: widget.editable,
                  border: InputBorder.none,
                  hintText: 'Write the body here',
                ),
                onChanged: (text) => widget.onBodyChange?.call(text),
                style: ThemeText.directionContent,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

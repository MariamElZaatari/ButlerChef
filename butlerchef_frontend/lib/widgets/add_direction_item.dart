import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/utils/styles.dart';
import 'package:flutter/material.dart';

class Direction extends StatefulWidget {
  const Direction({
    Key? key,
    this.title = 'Title',
    this.body =
    'Spray large skillet with cooking spray. Heat over medium-high heat until hot. Add onion and bell pepper; cook and stir 5 to 7 minutes or until onion begins to brown. Reduce heat to medium; cook 8 to 10 minutes or until bell pepper is softened, stirring occasionally.',
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
      height: 387,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 61),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
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
                        enabled: widget.editable,
                        border: InputBorder.none,
                        hintText: 'Write the title'
                    ),
                    onEditingComplete: () => widget.onTitleChange?.call(
                      _titleController.text,
                    ),
                    style: ThemeText.directionTitle,
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: TextField(
                  controller: _bodyController,
                  maxLines: 400,
                  decoration: InputDecoration(
                    enabled: widget.editable,
                    border: InputBorder.none,
                    hintText: 'Write the body here',
                  ),
                  onEditingComplete: () => widget.onBodyChange?.call(
                    _bodyController.text,
                  ),
                  style: ThemeText.directionContent,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
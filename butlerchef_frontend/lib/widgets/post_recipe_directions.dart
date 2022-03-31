import 'package:butler_chef/models/recipe_direction_model.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/add_direction_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:butler_chef/constants/styles.dart';

class PostRecipeDirections extends StatefulWidget {
  final Function(List<RecipeDirection>) callback;

  const PostRecipeDirections({
    Key? key,
    this.onPostClick,
    this.onDirectionsChange,
    this.directions = const [],
    required this.callback,
  }) : super(key: key);
  final List<RecipeDirection> directions;
  final void Function(List<RecipeDirection> directions)? onPostClick;
  final void Function(List<RecipeDirection> directions)? onDirectionsChange;

  @override
  PostRecipeDirectionsState createState() => PostRecipeDirectionsState();
}

class PostRecipeDirectionsState extends State<PostRecipeDirections>
    with AutomaticKeepAliveClientMixin {
  late final List<RecipeDirection> _directions = [];

  @override
  void initState() {
    super.initState();
    _directions.addAll(widget.directions);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: AppColors.backgroundColor,
        ),
        itemCount: _directions.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _directions.length) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: _onAddClicked,
                  child: Container(
                    height: 221,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.fromLTRB(15, 41, 15, 21),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          text: '',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                                text: ' Add Direction',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // widget.callback(_directions);
                      widget.onPostClick!(_directions);
                    },
                    child: Text(
                      'Post',
                      style: ThemeText.buttonText,
                    ),
                  ),
                )
              ],
            );
          }
          return Column(
            children: [
              Direction(
                title: _directions[index].title,
                body: _directions[index].content,
                editable: true,
                onTitleChange: (title) => _onTitleChange(
                  index,
                  title,
                ),
                onBodyChange: (body) => _onBodyChange(
                  index,
                  body,
                ),
              ),
              Container(
                height: 29,
                width: 29,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    (index + 1).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onAddClicked() {
    _directions.add(RecipeDirection(title: '', content: ''));
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  void _onTitleChange(int index, String title) {
    _onDirectionChange(index, title: title);
  }

  void _onBodyChange(int index, String body) {
    _onDirectionChange(index, body: body);
  }

  void _onDirectionChange(
    int index, {
    String? title,
    String? body,
  }) {

    setState(() {
      //
      if (title != null) {
        print("_directions[index].title");
        print(_directions[index].title);
        _directions[index].title = title;
      }
      //
      if (body != null) {
        print("_directions[index].content");
        print(_directions[index].content);
        _directions[index].content = body;
      }
    });
  }
}

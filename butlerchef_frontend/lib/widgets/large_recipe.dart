import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/top_recipe_bar.dart';
import 'package:butler_chef/widgets/bottom_recipe_bar.dart';

class LargeRecipe extends StatelessWidget {
  const LargeRecipe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Object> entries = <Object>['A', 'B', 'C'];
//    final List<int> colorCodes = <int>[600, 500, 100];
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 563,
                width: 325,
                margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(
                  height: 563,
                  width: 325,
                  margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                  padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      stops: [0.01, 0.2, 0.3, 0.4, 0.9],
                      colors: <Color>[
                        Color(0x66000000),
                        Color(0x0D000000),
                        Color(0x00000000),
                        Color(0x00000000),
                        Color(0x66000000),
                      ], // red to yellow // repeats the gradient over the canvas
                    ),
                  )),
              Container(
                height: 563,
                width: 325,
                margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: TopRecipeBar(
                            starSize: 28.0,
                          ),
                        ),
                        flex: 1),
                    Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(''),
                        ),
                        flex: 4),
                    Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomRecipeBar(
                            titleSize: 36.0,
                            infoSize: 21.0,
                            titleWidth: 400.0,
                            isSmall: false,
                          ),
                        ),
                        flex: 5),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

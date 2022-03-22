import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/app_colors.dart';

class RecipeAuthor extends StatelessWidget {
  const RecipeAuthor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
              ),
            )),
        Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mike Cruz',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.white),
              ),
            )),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }
}

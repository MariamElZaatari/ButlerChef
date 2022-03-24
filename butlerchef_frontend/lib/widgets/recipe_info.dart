import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeInfo extends StatelessWidget {
  final double _size;
  const RecipeInfo({
    Key? key, required size
  }) : _size=size, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.mountain,
                    color: AppColors.green, size: _size),
              ),
              const TextSpan(
                  text: " Easy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(width:12,),
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.solidClock,
                    color: AppColors.green, size: 21),
              ),
              TextSpan(
                  text: " 15 min",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(width:12,),
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.utensils,
                    color: AppColors.green, size: 21),
              ),
              TextSpan(
                  text: " 1 srv",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    )
    )
    ;
  }
}

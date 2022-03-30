import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeInfo extends StatelessWidget {
  final double _size;
  final String? level;
  final String? time;
  final String? serving;

  const RecipeInfo({
    Key? key, required size, required this.level, required this.time, required this.serving,
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
              TextSpan(
                  text: " "+level.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(width:12,),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.solidClock,
                    color: AppColors.green, size: _size),
              ),
              TextSpan(
                  text: " "+time.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(width:12,),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.utensils,
                    color: AppColors.green, size: _size),
              ),
              TextSpan(
                  text: " "+serving.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    )
    )
    ;
  }
}

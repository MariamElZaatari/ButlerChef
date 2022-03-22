import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class IngredientStats extends StatelessWidget {
  const IngredientStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <RichText>[
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.kitchen_rounded,
                    color: AppColors.white, size: 28),
              ),
              TextSpan(
                  text: "4",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
              TextSpan(
                  text: "/9",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ],
          ),
        )
      ],
    );
  }
}

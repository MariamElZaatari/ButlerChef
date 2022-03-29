import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class IngredientStats extends StatelessWidget {
  final int? total;
  final int? fridge;

  const IngredientStats({
    Key? key,
    required this.total,
    required this.fridge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <RichText>[
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.kitchen_rounded,
                    color: AppColors.white, size: 28),
              ),
              TextSpan(
                  text: fridge.toString()+"/",
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
              TextSpan(
                  text: total.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ],
          ),
        )
      ],
    );
  }
}

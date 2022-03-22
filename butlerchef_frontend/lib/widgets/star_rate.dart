import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class StarRate extends StatelessWidget {
  const StarRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: 28,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: 28,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: 28,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: 28,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: 28,
        ),
      ],
    );
  }
}
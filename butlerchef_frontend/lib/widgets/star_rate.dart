import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class StarRate extends StatelessWidget {
  final double _size;

  const StarRate({
    Key? key, required double size,
  }) : _size = size, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: _size,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: _size,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: _size,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: _size,
        ),
        Icon(
          Icons.star_rounded,
          color: AppColors.star,
          size: _size,
        ),
      ],
    );
  }
}
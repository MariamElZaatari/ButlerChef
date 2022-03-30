import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(left: 5, top: 21),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
            onTap: () => {Navigator.pop(context)},
            child: const Align(
                alignment: Alignment.center,
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white, size: 41))));
  }
}

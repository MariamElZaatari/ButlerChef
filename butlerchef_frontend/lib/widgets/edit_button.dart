import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/edit_profile_screen.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.solidEdit,
          size: 25,
          color: AppColors.green,
        ),
        onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditProfileScreen();
            },
          ),
        )
        },
      ),
    );
  }
}

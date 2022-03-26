import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) {
//                              return EditProfileScreen();
//                            },
//                          ),
//                        )
          },
        ),
    );
  }
}

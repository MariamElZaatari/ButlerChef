import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../screens/upload_user_image_screen.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    Key? key,
  }) : super(key: key);

  @override
  EditButtonState createState() => EditButtonState();
}

class EditButtonState extends State<EditButton> {
  User user = User();

  void setUser(newUser) {
    setState(() {
      user = newUser;
      Provider.of<UserProvider>(context, listen: false).setUser(user);
    });
  }

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UploadUserImage(
                  callback: setUser,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

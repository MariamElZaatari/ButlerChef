import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/profile_nav_bar.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/edit_button.dart';

import 'package:butler_chef/constants/styles.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late final TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController(text: "Mike Cruz");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 181,
                child: Image.network(
                  'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=',
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 181,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0x00000000),
                      Color(0x66000000),
                    ],
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 181,
              padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: _controller.text,
                    children: [
                      //Edit Button
                      WidgetSpan(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColors.green, width: 3),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 21, horizontal: 50),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                maxLength: 26,
                                                textAlign: TextAlign.center,
                                                style: ThemeText.dialogInput,
                                                decoration: const InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors.brown),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors.green),
                                                    ),
                                                    hintText: 'First and Last Name'),
                                                controller: _controller,
                                                onSubmitted: (text) =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: 181,
              child: const EditButton(),
            )
          ],
        ),
        const Expanded(
          child: ProfileNavBar(),
          flex: 4,
        ),
      ],
    );
  }
}

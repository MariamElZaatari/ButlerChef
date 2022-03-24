import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/profile_nav_bar.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: 181,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment
                        .bottomCenter,
                    colors: <Color>[
                      Color(0x00000000),
                      Color(0x66000000),
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
              height: 181,
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Mike Cruz',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 8,
                        color: AppColors.white),
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: 181,
              child: Align(
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
              ),
            ),
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

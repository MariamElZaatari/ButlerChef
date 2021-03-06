import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/fridge_nav_bar.dart';
import 'package:butler_chef/constants/app_colors.dart';

class Fridge extends StatelessWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 141,
                child: Image.asset(
                  'assets/images/fridge.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 141,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      stops: [0.1, 0.5, 0.9],
                      colors: <Color>[
                        Color(0x00000000),
                        Color(0x66000000),
                        Color(0x00000000),
                      ], // red to yellow // repeats the gradient over the canvas
                    ),
                  )),
              SizedBox(
                height: 141,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    'FRIDGE',
                    style: TextStyle(
                        fontSize: 41,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          flex: 1,
        ),
        const Expanded(
          child: FridgeNavBar(),
          flex: 4,
        ),
      ],
    );
  }
}

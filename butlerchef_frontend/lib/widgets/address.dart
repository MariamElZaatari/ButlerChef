import 'package:butler_chef/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/edit_button.dart';

class Address extends StatelessWidget {
  const Address({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 241,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
        const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(
                0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Title',
                  style: ThemeText.addressTitle,
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Street Address',
                        style: ThemeText.addressSubtitle,
                        textAlign: TextAlign.left,
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'street name',
                        style: ThemeText.addressInput,
                        textAlign: TextAlign.left,
                      )),
                ],
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'City',
                      style: ThemeText.addressSubtitle,
                      textAlign: TextAlign.left,
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'city name',
                      style: ThemeText.addressInput,
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Phone Number',
                      style: ThemeText.addressSubtitle,
                      textAlign: TextAlign.left,
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '1234567',
                      style: ThemeText.addressInput,
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
          ),
          const EditButton(),
        ],
      ),
    );
  }
}

import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Address extends StatefulWidget {
  const Address({
    Key? key,
    this.title = 'Title',
    this.street = 'Street',
    this.city = 'City',
    this.phone = '01234567',
    this.editable = false,
    this.onTitleChange,
    this.onStreetChange,
    this.onCityChange,
    this.onPhoneChange,
  }) : super(key: key);
  final String? title;
  final String? street;
  final String? city;
  final String? phone;
  final bool editable;
  final void Function(String title)? onTitleChange;
  final void Function(String body)? onStreetChange;
  final void Function(String body)? onCityChange;
  final void Function(String body)? onPhoneChange;

  @override
  AddressState createState() => AddressState();
}

class AddressState extends State<Address> {
  late final TextEditingController _titleController;
  late final TextEditingController _streetController;
  late final TextEditingController _cityController;
  late final TextEditingController _phoneController;
  bool _isEnable = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _streetController = TextEditingController(text: widget.street);
    _cityController = TextEditingController(text: widget.city);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 281,
      width: 241,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: TextField(
                      enabled: _isEnable,
                      controller: _titleController,
                      decoration: InputDecoration(
                          enabled: widget.editable,
                          border: InputBorder.none,
                          hintText: 'Address Title',
                          hintStyle: const TextStyle(
                              color: AppColors.placeholder,
                              fontWeight: FontWeight.normal)),
                      onEditingComplete: () => widget.onTitleChange?.call(
                        _titleController.text,
                      ),
                      style: ThemeText.directionTitle,
                      textAlign: TextAlign.left,
                    ),
                  ))),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Street Address',
                            style: ThemeText.addressSubtitle,
                            textAlign: TextAlign.left,
                          ))),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          enabled: _isEnable,
                          controller: _streetController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            enabled: widget.editable,
                            border: InputBorder.none,
                            hintText: 'Street',
                            hintStyle: const TextStyle(
                                color: AppColors.placeholder,
                                fontWeight: FontWeight.normal),
                          ),
                          onEditingComplete: () => widget.onStreetChange?.call(
                            _streetController.text,
                          ),
                          style: ThemeText.directionContent,
                          textAlign: TextAlign.left,
                        ),
                      )),
                ],
              )),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'City',
                        style: ThemeText.addressSubtitle,
                        textAlign: TextAlign.left,
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        enabled: _isEnable,
                        controller: _cityController,
                        maxLines: 1,
                        decoration: InputDecoration(
                            enabled: widget.editable,
                            border: InputBorder.none,
                            hintText: 'City',
                            hintStyle: const TextStyle(
                                color: AppColors.placeholder,
                                fontWeight: FontWeight.normal)),
                        onEditingComplete: () => widget.onCityChange?.call(
                          _cityController.text,
                        ),
                        style: ThemeText.directionContent,
                        textAlign: TextAlign.left,
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(children: [
                const Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone Number',
                          style: ThemeText.addressSubtitle,
                          textAlign: TextAlign.left,
                        ))),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        enabled: _isEnable,
                        controller: _phoneController,
                        maxLines: 1,
                        decoration: InputDecoration(
                            enabled: widget.editable,
                            border: InputBorder.none,
                            hintText: '01234567',
                            hintStyle: const TextStyle(
                                color: AppColors.placeholder,
                                fontWeight: FontWeight.normal)),
                        onEditingComplete: () => widget.onPhoneChange?.call(
                          _phoneController.text,
                        ),
                        style: ThemeText.directionContent,
                        textAlign: TextAlign.left,
                      ),
                    )),
              ])),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidEdit,
                        size: 25,
                        color: AppColors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          _isEnable = true;
                        });
                      })))
        ],
      ),
    );
  }
}

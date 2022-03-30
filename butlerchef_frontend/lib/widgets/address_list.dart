import 'package:butler_chef/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'address.dart';

class AddressList extends StatefulWidget {
  const AddressList(
      {Key? key,
      this.onAddressesChange,
      this.onSelectedChange,
      this.addresses = const [],
      this.selected = const []})
      : super(key: key);
  final List<Address> addresses;
  final void Function(List<Address> addresses)? onAddressesChange;
  final List<bool> selected;
  final void Function(List<bool> selected)? onSelectedChange;

  @override
  AddressListState createState() => AddressListState();
}

class AddressListState extends State<AddressList>
    with AutomaticKeepAliveClientMixin {
  late final List<bool> _selected = [];
  late final List<Address> _addresses = [];

  Icon notSelectedIcon = const Icon(Icons.check_circle_rounded,
      color: AppColors.grayIcon, size: 35);
  Icon selectedIcon =
      const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 35);

  @override
  void initState() {
    super.initState();
    _selected.addAll(widget.selected);
    _addresses.addAll(widget.addresses);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: AppColors.backgroundColor,
        ),
        itemCount: _addresses.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _addresses.length) {
            return InkWell(
              onTap: _onAddClicked,
              child: Container(
                height: 241,
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),

//                margin: const EdgeInsets.symmetric(vertical: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 61, vertical: 21),
                decoration: BoxDecoration(
                  color: AppColors.green,
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
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                      children: [
                        WidgetSpan(
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: 'Add Address'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Column(
            children: [
              SizedBox(
                child: Address(
                  title: _addresses[index].title,
                  street: _addresses[index].street,
                  city: _addresses[index].street,
                  phone: _addresses[index].street,
                  editable: true,
                  onTitleChange: (title) => _onTitleChange(
                    index,
                    title,
                  ),
                  onStreetChange: (street) => _onStreetChange(
                    index,
                    street,
                  ),
                  onCityChange: (city) => _onCityChange(
                    index,
                    city,
                  ),
                  onPhoneChange: (phone) => _onPhoneChange(
                    index,
                    phone,
                  ),
                ),
              ),
              Center(
                  child: IconButton(
                      icon: _selected[index] ? selectedIcon : notSelectedIcon,
                      onPressed: () => {_onSelectedChange(index)})),
            ],
          );
        },
      ),
    );
  }

  void _onAddClicked() {
    _addresses.add(const Address(
      title: '',
      street: '',
      city: '',
      phone: '',
    ));
    _selected.add(false);
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  void _onTitleChange(int index, String title) {
    _onAddressChange(index, title: title);
  }

  void _onStreetChange(int index, String street) {
    _onAddressChange(index, street: street);
  }

  void _onCityChange(int index, String city) {
    _onAddressChange(index, city: city);
  }

  void _onPhoneChange(int index, String phone) {
    _onAddressChange(index, phone: phone);
  }

  void _onAddressChange(
    int index, {
    String? title,
    String? street,
    String? city,
    String? phone,
  }) {
    final item = _addresses[index];
    setState(() {
      _addresses[index] = Address(
        title: title ?? item.title,
        street: street ?? item.street,
        city: city ?? item.city,
        phone: phone ?? item.phone,

      );
    });
    widget.onAddressesChange?.call(_addresses);
  }

  void _onSelectedChange(int index) {
    setState(() {
      for (var i = 0; i < _selected.length; i++) {
        _selected[i] = false;
      }
      _selected[index] = true;
    });
    widget.onSelectedChange?.call(_selected);
  }
}

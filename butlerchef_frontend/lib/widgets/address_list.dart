import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/screens/google_map_screen.dart';
import 'package:flutter/material.dart';
import '../models/address_model.dart';
import 'address.dart';

class AddressList extends StatefulWidget {
  const AddressList(
      {Key? key,
      this.onAddressesChange,
      this.onSelectedChange,
      this.selected = const [], this.addresses=const []})
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
  late List<Address> _addresses = <Address>[];
  Address address = Address();

  setAddress(newAddress) {
    setState(() {
      address = newAddress;
    });
  }

  Icon notSelectedIcon = const Icon(Icons.check_circle_rounded,
      color: AppColors.grayIcon, size: 35);
  Icon selectedIcon =
      const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 35);

  @override
  void initState() {
    _selected.addAll(widget.selected);
    _addresses.addAll(widget.addresses);
    super.initState();
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
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 221,
                  width: 241,
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 61, vertical: 21),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
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
                      child: Align(
                          child: Icon(
                            Icons.add,
                            color: AppColors.brown,
                            size: 61,
                          ),
                          alignment: Alignment.center)),
                ),
              ),
            );
          }
          return Center(
            child: Column(
              children: [
                SizedBox(
                  child: AddressItem(
                    title: _addresses[index].title,
                    street: _addresses[index].street,
                    city: _addresses[index].city,
                    phone: _addresses[index].phone,
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
            ),
          );
        },
      ),
    );
  }

  void _onAddClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GoogleMapScreen(callback: setAddress);
        },
      ),
    ).then((value) {
      _addresses.add(Address(
        title: '',
        street: address.street ?? '',
        city: address.city ?? '',
        phone: '',
      ));
      _selected.add(false);
      setState(() {});
    });
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

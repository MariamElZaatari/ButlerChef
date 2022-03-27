import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:butler_chef/utils/app_colors.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  AddProductsState createState() => AddProductsState();
}

class AddProductsState extends State<AddProducts> {
  final key = GlobalKey<AnimatedListState>();
//  int count = -1;

  Widget buildInsertButton() => Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
          width: 341,
          height: 41,
          child: ElevatedButton(
              onPressed: () => insertItem(0),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.green),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return AppColors.white.withOpacity(0.12);
                    }
                    return null;
                  },
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: FaIcon(FontAwesomeIcons.plus,
                          color: AppColors.white, size: 21),
                    ),
                    TextSpan(
                        text: " Add Ingredient",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white,
                            letterSpacing: 4)),
                  ],
                ),
              ))));

  Widget buildItem(int index, Animation<double> animation) => AddProductsItem(
        animation: animation,
        onClicked: () => removeItem(index),
      );

  void removeItem(int index) {
    key.currentState?.removeItem(
      index,
      (context, animation) => buildItem(index, animation),
    );
  }

  void insertItem(int index) {
    key.currentState?.insertItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: AnimatedList(
                padding: const EdgeInsets.symmetric(vertical: 15),
                key: key,
                initialItemCount: 1,
                itemBuilder: (context, index, animation) {
                  return buildItem(index, animation);
                }),
          ),
          Container(
            child: buildInsertButton(),
          ),
          Container(
            height: 21.0,
            width:321,
            margin: EdgeInsets.only(bottom:21),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FittedBox(
              child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.green,
                      size: 121,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
//  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//  late ListModel<AddProductsItem> _list;
//
//  int? _selectedItem;
//
//  late int _nextItem;
//
//  @override
//  void initState() {
//    super.initState();
//    _list = ListModel<AddProductsItem>(
//      listKey: _listKey,
//      initialItems: <AddProductsItem>[AddProductsItem()],
//      removedItemBuilder: _buildRemovedItem,
//    );
//    _nextItem = 3;
//  }
//
//  Widget _buildItem(
//      BuildContext context, int index, Animation<double> animation) {
//    return CardItem(
//      animation: animation,
//      item: _list[index],
//      selected: _selectedItem == _list[index],
//      onTap: () {
//        setState(() {
//          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
//        });
//      },
//    );
//  }
//
//  Widget _buildRemovedItem(
//      int item, BuildContext context, Animation<double> animation) {
//    return CardItem(
//      animation: animation,
//      item: item,
//      selected: false,
//      // No gesture detector here: we don't want removed items to be interactive.
//    );
//  }
//
//  // Insert the "next item" into the list model.
//  void _insert() {
//    final int index =
//        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
//    _list.insert(index, _nextItem++);
//  }
//
//  // Remove the selected item from the list model.
//  void _remove() {
//    if (_selectedItem != null) {
//      _list.removeAt(_list.indexOf(_selectedItem!));
//      setState(() {
//        _selectedItem = null;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('AnimatedList'),
//          actions: <Widget>[
//            IconButton(
//              icon: const Icon(Icons.add_circle),
//              onPressed: _insert,
//              tooltip: 'insert a new item',
//            ),
//            IconButton(
//              icon: const Icon(Icons.remove_circle),
//              onPressed: _remove,
//              tooltip: 'remove the selected item',
//            ),
//          ],
//        ),
//        body: Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: AnimatedList(
//            key: _listKey,
//            initialItemCount: _list.length,
//            itemBuilder: _buildItem,
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//typedef RemovedItemBuilder<T> = Widget Function(
//    T item, BuildContext context, Animation<double> animation);
//
//class ListModel<E> {
//  ListModel({
//    required this.listKey,
//    required this.removedItemBuilder,
//    Iterable<E>? initialItems,
//  }) : _items = List<E>.from(initialItems ?? <E>[]);
//
//  final GlobalKey<AnimatedListState> listKey;
//  final RemovedItemBuilder<E> removedItemBuilder;
//  final List<E> _items;
//
//  AnimatedListState? get _animatedList => listKey.currentState;
//
//  void insert(int index, E item) {
//    _items.insert(index, item);
//    _animatedList!.insertItem(index);
//  }
//
//  E removeAt(int index) {
//    final E removedItem = _items.removeAt(index);
//    if (removedItem != null) {
//      _animatedList!.removeItem(
//        index,
//        (BuildContext context, Animation<double> animation) {
//          return removedItemBuilder(removedItem, context, animation);
//        },
//      );
//    }
//    return removedItem;
//  }
//
//  int get length => _items.length;
//
//  E operator [](int index) => _items[index];
//
//  int indexOf(E item) => _items.indexOf(item);
//}
//
//class CardItem extends StatelessWidget {
//  const CardItem({
//    Key? key,
//    this.onTap,
//    this.selected = false,
//    required this.animation,
//    required this.item,
//  })  : assert(item >= 0),
//        super(key: key);
//
//  final Animation<double> animation;
//  final VoidCallback? onTap;
//  final AddProductsItem item;
//  final bool selected;
//
//  @override
//  Widget build(BuildContext context) {
//    TextStyle textStyle = Theme.of(context).textTheme.headline4!;
//    if (selected) {
//    textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
//    }
//    return Padding(
//    padding: const EdgeInsets.all(2.0),
//    child: SizeTransition(
//    axis: Axis.vertical,
//    sizeFactor: animation,
//    child: GestureDetector(
//    behavior: HitTestBehavior.opaque,
//    onTap: onTap,
//    child: SizedBox(
//    height: 80.0,
//    child: Card(
//    color: Colors.primaries[item % Colors.primaries.length],
//    child: Center(
//    child: Text('Item $item', style: textStyle),
//    ),
//    ),
//    ),
//    ),
//    ),
//    );
//    }
//}

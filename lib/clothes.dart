import 'package:flutter/material.dart';
import 'package:cart_sample/drawer.dart';
import 'package:cart_sample/data/data.dart';
import 'package:cart_sample/inherited.dart';

class Clothes extends StatefulWidget {
  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  var cartItem;
  List<Item> listFruit = [
    Item(id: 11, item: "Quần Jean", check: false),
    Item(id: 12, item: "Áo sơ mi", check: false),
    Item(id: 13, item: "Túi xách", check: false),
    Item(id: 14, item: "Thắt lưng", check: false),
    Item(id: 15, item: "Giày", check: false)
  ];

  void changeCheck(List<Item> listFruit, int index, bool checked) {
    setState(() {
      listFruit[index].check = checked;
    });
  }

  void _addItemtoCart(int itemId) {
    setState(() {
      cartItem.cart.addItemToCart(itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    cartItem = CartWidget.of(context);
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Quần áo"),
      ),

      body: ListView.builder(
        itemCount: listFruit.length,
        itemBuilder: (context, index) {
          return Container(
            child: CheckboxListTile(
              value: listFruit[index].check,
              title: Text(listFruit[index].item),
              onChanged: (bool  val) {
                changeCheck(listFruit, index, val);
                _addItemtoCart(listFruit[index].id);
              },
            ),
          );
        },
      ),

    );
  }
}
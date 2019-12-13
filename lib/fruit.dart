import 'package:flutter/material.dart';
import 'package:cart_sample/drawer.dart';
import 'package:cart_sample/data/data.dart';

import 'package:cart_sample/inherited.dart';


class Fruit extends StatefulWidget {
  @override
  _FruitState createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  var cartItem;
  List<Item> listFruit = [
    Item(id: 1, item: "Cam", check: false),
    Item(id: 2, item: "Táo", check: false),
    Item(id: 3, item: "Xoài", check: false),
    Item(id: 4, item: "Mít", check: false),
    Item(id: 5, item: "Nho", check: false)
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
        title: Text("Hoa quả"),
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
      )

    );
  }
}
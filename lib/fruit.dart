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

  void _removeItemFromCart(int index) {
    setState(() {
      cartItem.cart.removeItemFromCart(index);
    });
  }

  void _addItemToList() {
    setState(() {
      cartItem.cart.listFruit.add(Item(id: 6, item: "Bưởi", check: false));
    });
  }

  void _removeItemFromList(int itemId) {
    setState(() {
      cartItem.cart.listFruit.removeWhere((item) => item.id == itemId);
    });
  }

  void _showDialog(int itemId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Xác nhận xóa"),
          content: new Text("Bạn có chắc chắn muốn xóa không?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Hủy"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Xóa"),
              onPressed: () {
                _removeItemFromList(itemId);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    cartItem = CartWidget.of(context);
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Hoa quả"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/add-item");
            },
          )
        ],
      ),

      body: ListView.builder(
        itemCount: cartItem.cart.listFruit.length,
        itemBuilder: (context, index) {
          return GestureDetector (
              onLongPress: () {
                print("Xem thu cai");
                _showDialog(cartItem.cart.listFruit[index].id);
              },
              child: Container(
              child: CheckboxListTile(
                value: cartItem.cart.listFruit[index].check,
                title: Text(cartItem.cart.listFruit[index].item),
                onChanged: (bool  val) {
                  print(val);
                  changeCheck(cartItem.cart.listFruit, index, val);
                  if (val == true) {
                    _addItemtoCart(cartItem.cart.listFruit[index].id);
                  } else {
                    _removeItemFromCart(cartItem.cart.listFruit[index].id);
                  }
                },
                
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}



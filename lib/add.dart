import 'package:cart_sample/data/data.dart';
import 'package:flutter/material.dart';

import 'inherited.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final myController = TextEditingController();

  var cartItem;
  void _addItemToList() {
    setState(() {
      cartItem.cart.listFruit.add(Item(id: cartItem.cart.listFruit.length+1, item: myController.text, check: false));
      Navigator.pop(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    cartItem = CartWidget.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Thêm vào danh sách"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            _addItemToList();
          },
          )
      ],
      ),
      body: Center(
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              labelText: "Nhập tên sản phẩm"
            ),
          ),
        

      ),
    );
  }
}
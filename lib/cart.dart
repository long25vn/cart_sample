import 'package:flutter/material.dart';
import 'package:cart_sample/drawer.dart';
import 'package:cart_sample/inherited.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartItem;

  @override
  Widget build(BuildContext context) {
    cartItem = CartWidget.of(context);
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Giỏ hàng"),
      ),

      body: Center(
        child: Text("${cartItem.cart.list_item_id}"),
      ),

    );
  }
}
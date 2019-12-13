

import 'package:flutter/material.dart';

class CartWidget extends InheritedWidget {
  final Widget child;
  final Cart cart;
  
  CartWidget({Key key, this.cart, this.child}) : super(key: key, child: child);

  static CartWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CartWidget));
  }

  @override
  bool updateShouldNotify(CartWidget oldWidget) {
    return true;
  }
}


class Cart {
  List<int> list_item_id=[];
  addItemToCart(int item_id) {
    list_item_id.add(item_id);
  } 
}
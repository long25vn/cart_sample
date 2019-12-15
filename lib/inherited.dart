

import 'package:cart_sample/data/data.dart';
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

  List<Item> listFruit = [
    Item(id: 1, item: "Cam", check: false),
    Item(id: 2, item: "Táo", check: false),
    Item(id: 3, item: "Xoài", check: false),
    Item(id: 4, item: "Mít", check: false),
    Item(id: 5, item: "Nho", check: false)
  ];

  addItemToCart(int item_id) {
    list_item_id.add(item_id);
    print("Mang vua duoc them");
    print( list_item_id);
  } 

  removeItemFromCart(int itemId) {
    list_item_id.removeWhere((item) => item == itemId);
    print("Mang sau khi xoa");
    print( list_item_id);
  } 
}
import 'package:flutter/material.dart';


class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text("Drawer Sample"),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("Trang chủ"),
            onTap: () {
               Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text("Hoa quả"),
            onTap: () {
               Navigator.pushNamed(context, '/fruit');
            },
          ),
          ListTile(
            title: Text("Quần áo"),
            onTap: () {
               Navigator.pushNamed(context, '/clothes');
            },
          ),
          ListTile(
            title: Text("Giỏ hàng"),
            onTap: () {
               Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
    );
  }
}
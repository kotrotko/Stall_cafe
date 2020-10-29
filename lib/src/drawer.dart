import 'package:flutter/material.dart';

import 'home_page.dart';
import 'menu_page.dart';
import 'order_page.dart';
import 'dish_description.dart';

import '../locale/app_localization.dart';

class DrawerPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text(
            AppLocalization.of(context).texMexCousine,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        ListTile(
            title: Text(
              AppLocalization.of(context).welcome,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }),
        ListTile(
          title: Text(
            AppLocalization.of(context).menu,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
        ),
        ListTile(
          title: Text(
            AppLocalization.of(context).order,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(),
              ),
            );
          },
        ),
        ListTile(
          title: Text(
            AppLocalization.of(context).dishDescription,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DishDescriptionPage(),
              ),
            );
          },
        ),
      ]),
    );
  }
}

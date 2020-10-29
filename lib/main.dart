import 'package:flutter/material.dart';

import './src/home_page.dart';
import './src/menu_page.dart';
import './src/order_page.dart';
import './src/dish_description.dart';

//this is stall_cafe, v.24 Oct 2020
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        MenuPage.routeName: (context) => MenuPage(),
        OrderPage.routeName: (context) => OrderPage(),
        DishDescriptionPage.routeName: (context) => DishDescriptionPage(),
      },
    );
  }
}

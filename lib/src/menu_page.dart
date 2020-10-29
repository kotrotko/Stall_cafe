import 'package:flutter/material.dart';

import 'date_time.dart';
import 'prefs_helper.dart';
import '../locale/app_localization.dart';

class MenuPage extends StatefulWidget {
  static const routeName = 'menuPage';

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> _dishMenu = [
    'Enchilada',
    'Taco Bowl',
    'Pico de Gallo',
  ];

  List<String> order = [];

  @override
  Widget build(BuildContext context) {
    getOrder().then((value) => {
          setState(() {
            order = value;
          })
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Jägersro",
            style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(AppLocalization.of(context).menu,
              style: TextStyle(fontSize: 30.0)),
          alignment: Alignment.center,
        ),
        Container(
          child: Center(
            child: Text(AppLocalization.of(context).touchAHeart,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
          ),
        ),
        Container(
          child: Center(
            child: Text(AppLocalization.of(context).now,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0)),
          ),
        ),
        Center(child: MenuDateTime()),
        Expanded(
            child: ListView.builder(
                itemCount: _dishMenu.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(_dishMenu[index]),
                    trailing: order.contains(_dishMenu[index])
                        ? IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              List<String> currentOrderEntries =
                                  await getOrder();
                              currentOrderEntries.remove(_dishMenu[index]);
                              saveOrder(currentOrderEntries);
                              print(currentOrderEntries);
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () async {
                              List<String> currentOrderEntries =
                                  await getOrder();
                              currentOrderEntries.add(_dishMenu[index]);
                              saveOrder(currentOrderEntries);
                              print(currentOrderEntries);
                            }),
                  );
                })),
      ]),
    );
  }
}

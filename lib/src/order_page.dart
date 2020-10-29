import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'prefs_helper.dart';
import '../locale/app_localization.dart';

class OrderPage extends StatefulWidget {
  static const routeName = 'orderPage';

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
          padding: EdgeInsets.only(top: 20.0),
          child: Text(AppLocalization.of(context).myOrder,
              style: TextStyle(fontSize: 30.0)),
          //alignment: Alignment.center,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: order.length,
              itemBuilder: (context, int i) {
                return ListTile(
                  title: Text(order[i]),
                  trailing: Icon(Icons.favorite, color: Colors.blue),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
                child: Text(AppLocalization.of(context).submit),
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();
                },
                child: Text(AppLocalization.of(context).cancel),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

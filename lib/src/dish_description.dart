import 'package:flutter/material.dart';

import 'prefs_helper.dart';
import 'allergy_button.dart';
import 'dish_price.dart';
import '../locale/app_localization.dart';

class DishDescriptionPage extends StatefulWidget {
  static const routeName = 'dishDescriptionPage';

  @override
  _DishDescriptionPageState createState() => _DishDescriptionPageState();
}

class _DishDescriptionPageState extends State<DishDescriptionPage> {
  List<String> _dishMenu = [
    'Enchilada',
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
          child: Text(AppLocalization.of(context).dishes,
              style: TextStyle(fontSize: 30.0)),
          alignment: Alignment.center,
        ),
        Container(
          height: 200.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/enchilada.jpg'),
            ),
          ),
        ),
        Column(children: <Widget>[
          // "Enchilada"
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1.0)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enchilada',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              12.0,
              8.0,
              0,
              0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalization.of(context).chile,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              12.0,
              8.0,
              0,
              0,
            ),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: AppLocalization.of(context).optionally,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                TextSpan(
                  text: AppLocalization.of(context).beef,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1.0)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(12.0, 8.0, 0, 8.0),
                    child: Text(AppLocalization.of(context).orderNow,
                        style: TextStyle(fontSize: 20.0)),
                  ),
                  Container(
                    child: order.contains(_dishMenu[0])
                        ? IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              List<String> currentOrderEntries =
                                  await getOrder();
                              currentOrderEntries.remove(_dishMenu[0]);
                              saveOrder(currentOrderEntries);
                              print(currentOrderEntries);
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () async {
                              List<String> currentOrderEntries =
                                  await getOrder();
                              currentOrderEntries.add(_dishMenu[0]);
                              saveOrder(currentOrderEntries);
                              print(currentOrderEntries);
                            }),
                  ),
                ]),
          ),
          Container(
            child: AllergyButton(),
          ),
          Container(
            child: DishPrice(),
          ),
        ]),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

import '../locale/app_localization.dart';

class DishPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(
          12.0,
          48.0,
          0.0,
          12.0,
        ),
      ),
      Expanded(
        child: Text(
          AppLocalization.of(context).price,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Text(
          '8.99 €',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'date_time.dart';
import 'drawer.dart';
import '../locale/app_localization.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppLocalizationDelegate _localeOverrideDelegate =
      AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      _localeOverrideDelegate
    ], supportedLocales: [
      const Locale('en', 'US'),
      const Locale('sv', 'SE')
    ], home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Jägersro",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            Container(
              width: 110.0,
              child: ListTile(
                leading: MaterialButton(
                  minWidth: 40.0,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      AppLocalization.load(Locale('en', 'US'));
                    });
                  },
                  child: Text('EN'),
                ),
                trailing: MaterialButton(
                  minWidth: 40.0,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      AppLocalization.load(Locale('sv', 'SE'));
                    });
                  },
                  child: Text('SE'),
                ),
              ),
            ),
          ]),
      drawer: Drawer(
        child: DrawerPages(),
      ),
      body: Column(children: <Widget>[
        Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          Container(
            child: Image.asset('assets/images/jagersro.jpg'),
          ),
          FractionalTranslation(
            translation: Offset(0.0, 0.5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 36,
              //decoration: BoxDecoration(color: Colors.white),
              child: Icon(
                Icons.restaurant_menu,
                color: Colors.blue,
                size: 50,
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 40.0,
        ),
        Expanded(
          child: Text(
            "Stallcafe",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          //padding: EdgeInsets.all(5.0),
        ),
        Expanded(
          child: OpenHours(),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0, bottom: 0.0),
          child: Text(
            AppLocalization.of(context).callUs,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
          child: FlatButton(
            textColor: Colors.blue,
            splashColor: Colors.blueAccent,
            onPressed: () => launch("tel:+0721371754"),
            child: Text(
              "0721371754",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          child: Text(
            AppLocalization.of(context).welcome,
            style: TextStyle(fontSize: 20),
          ),
          //padding: EdgeInsets.all(15.0),
        ),
        Container(
          padding: EdgeInsets.only(top: 6.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
          //child: MenuWeek(),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                AppLocalization.of(context).faceBook,
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              FlatButton(
                child: Icon(
                  MdiIcons.facebook,
                  color: Colors.blueGrey,
                ),
                onPressed: () async {
                  const url = 'https://www.facebook.com/jagersrotrav/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Kunde inte hitta $url';
                  }
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // list of locales
  String get opened {
    return Intl.message(
      'Opened',
      name: 'opened',
      desc: 'Cafe is opened now',
    );
  }

  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: 'Cafe is closed now',
    );
  }

  String get callUs {
    return Intl.message(
      'Call us:',
      name: 'callUs',
      desc: 'Call us button text',
    );
  }

  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'Greetings for home page',
    );
  }

  String get faceBook {
    return Intl.message(
      'Follow us on facebook:',
      name: 'faceBook',
      desc: 'fb for home page',
    );
  }

  String get texMexCousine {
    return Intl.message(
      'TexMex cousine',
      name: 'texMexCousine',
      desc: 'drawer header',
    );
  }

  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: 'drawer menu',
    );
  }

  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: 'drawer order',
    );
  }

  String get dishDescription {
    return Intl.message(
      'Dish Description',
      name: 'dishDescription',
      desc: 'drawer dish description',
    );
  }

  String get touchAHeart {
    return Intl.message(
      'touch a heart and make your order',
      name: 'touchAHeart',
      desc: 'meny touch a heart',
    );
  }

  String get now {
    return Intl.message(
      'now',
      name: 'now',
      desc: 'meny now',
    );
  }

  String get myOrder {
    return Intl.message(
      'My Order',
      name: 'myOrder',
      desc: 'order my order',
    );
  }

  String get submit {
    return Intl.message(
      'SUBMIT',
      name: 'submit',
      desc: 'order submit',
    );
  }

  String get cancel {
    return Intl.message(
      'CANCEL',
      name: 'cancel',
      desc: 'order cancel',
    );
  }

  String get dishes {
    return Intl.message(
      'Dishes',
      name: 'dishes',
      desc: 'dish description dishes',
    );
  }

  String get chile {
    return Intl.message(
      'Chile sauce, tortillas, beans, onion, cheddar',
      name: 'chile',
      desc: 'dish description chile',
    );
  }

  String get optionally {
    return Intl.message(
      'beef, chicken, vegetarian',
      name: 'optionally',
      desc: 'dish description optionally',
    );
  }

  String get beef {
    return Intl.message(
      'beef, chicken, vegetarian',
      name: 'beef',
      desc: 'dish description options',
    );
  }

  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: 'dish description order',
    );
  }

  String get allergens {
    return Intl.message(
      'Allergens',
      name: 'allergens',
      desc: 'dish description allergens',
    );
  }

  String get lactose {
    return Intl.message(
      'Lactose',
      name: 'lactose',
      desc: "dish description allergens lactose",
    );
  }

  String get price {
    return Intl.message(
      'Price:',
      name: 'price',
      desc: 'dish description prise',
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'sv'].contains(locale
      .languageCode); //check if the language is supported or not, based on the Locale instance provided.

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}

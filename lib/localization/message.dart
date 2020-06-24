import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class Message {
  Message(this.localeName);

  static Future<Message> load(Locale locale) {
    final String name =
        (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return Message(localeName);
    });
  }

  static Message of(BuildContext context) {
    return Localizations.of<Message>(context, Message);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'App Name',
      name: 'appName',
      desc: 'Name of the application',
      locale: localeName,
    );
  }

  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: 'Title of the application',
      locale: localeName,
    );
  }

  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: 'Author of the application',
      locale: localeName,
    );
  }

  String get changeLocale {
    return Intl.message(
      'Change Locale',
      name: 'changeLocale',
      desc: 'Change Locale of the application',
      locale: localeName,
    );
  }
}

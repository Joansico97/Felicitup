// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class IntlTrans {
  IntlTrans();

  static IntlTrans? _current;

  static IntlTrans get current {
    assert(_current != null,
        'No instance of IntlTrans was loaded. Try to initialize the IntlTrans delegate before accessing IntlTrans.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<IntlTrans> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = IntlTrans();
      IntlTrans._current = instance;

      return instance;
    });
  }

  static IntlTrans of(BuildContext context) {
    final instance = IntlTrans.maybeOf(context);
    assert(instance != null,
        'No instance of IntlTrans present in the widget tree. Did you add IntlTrans.delegate in localizationsDelegates?');
    return instance!;
  }

  static IntlTrans? maybeOf(BuildContext context) {
    return Localizations.of<IntlTrans>(context, IntlTrans);
  }

  /// `Próximamente`
  String get commingSoon {
    return Intl.message(
      'Próximamente',
      name: 'commingSoon',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<IntlTrans> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<IntlTrans> load(Locale locale) => IntlTrans.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

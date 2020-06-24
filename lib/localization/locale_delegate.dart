import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localization.dart';

/// 多语言委托
///   共通消息
class BsMessageLocalDelegate extends LocalizationsDelegate<Message> {
  /// 言語
  final Locale currentLocale;

  const BsMessageLocalDelegate(this.currentLocale);

  @override
  Future<Message> load(Locale locale) => Message.load(currentLocale);

  @override
  bool isSupported(Locale locale) {
    // 中国大陆
    // 中国香港
    // 英语
    // 日语
    return LocaleConst.zhCN == locale ||
        LocaleConst.zhHK == locale ||
        LocaleConst.en == locale ||
        LocaleConst.ja == locale;
  }

  // 语言切换实时反应需要设置成true
  @override
  bool shouldReload(BsMessageLocalDelegate old) => true;
}

/// 多语言委托(iOS)
class BsCupertinoLocalDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  /// 语言
  final Locale currentLocale;

  const BsCupertinoLocalDelegate(this.currentLocale);

  /// 根据应用的当前语言加载
  @override
  Future<CupertinoLocalizations> load(Locale locale) => BsCupertinoLocalizations.load(currentLocale);

  @override
  bool isSupported(Locale locale) {
    // 中国大陆
    // 中国香港
    // 英语
    // 日语
    return LocaleConst.zhCN == locale ||
        LocaleConst.zhHK == locale ||
        LocaleConst.en == locale ||
        LocaleConst.ja == locale;
  }

  @override
  bool shouldReload(BsCupertinoLocalDelegate old) => true;
}

/// 多语言委托(Android共通)
class BsMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  /// 语言
  final Locale currentLocale;

  const BsMaterialLocalizationsDelegate(this.currentLocale);

  @override
  bool isSupported(Locale locale) => kMaterialSupportedLanguages.contains(locale.languageCode);

  static final Map<Locale, Future<MaterialLocalizations>> _loadedTranslations =
      <Locale, Future<MaterialLocalizations>>{};

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    // 使用应用当前的语言
    locale = currentLocale;
    // 以下内容复制自「GlobalMaterialLocalizations.delegate」的「_MaterialLocalizationsDelegate」方法
    assert(isSupported(locale));
    return _loadedTranslations.putIfAbsent(locale, () {
      final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
      assert(
        locale.toString() == localeName,
        'Flutter does not support the non-standard locale form $locale (which '
        'might be $localeName',
      );

      intl.DateFormat fullYearFormat;
      intl.DateFormat compactDateFormat;
      intl.DateFormat shortDateFormat;
      intl.DateFormat mediumDateFormat;
      intl.DateFormat longDateFormat;
      intl.DateFormat yearMonthFormat;
      intl.DateFormat shortMonthDayFormat;
      if (intl.DateFormat.localeExists(localeName)) {
        fullYearFormat = intl.DateFormat.y(localeName);
        compactDateFormat = intl.DateFormat.yMd(localeName);
        shortDateFormat = intl.DateFormat.yMMMd(localeName);
        mediumDateFormat = intl.DateFormat.MMMEd(localeName);
        longDateFormat = intl.DateFormat.yMMMMEEEEd(localeName);
        yearMonthFormat = intl.DateFormat.yMMMM(localeName);
        shortMonthDayFormat = intl.DateFormat.MMMd(localeName);
      } else if (intl.DateFormat.localeExists(locale.languageCode)) {
        fullYearFormat = intl.DateFormat.y(locale.languageCode);
        compactDateFormat = intl.DateFormat.yMd(locale.languageCode);
        shortDateFormat = intl.DateFormat.yMMMd(locale.languageCode);
        mediumDateFormat = intl.DateFormat.MMMEd(locale.languageCode);
        longDateFormat = intl.DateFormat.yMMMMEEEEd(locale.languageCode);
        yearMonthFormat = intl.DateFormat.yMMMM(locale.languageCode);
        shortMonthDayFormat = intl.DateFormat.MMMd(locale.languageCode);
      } else {
        fullYearFormat = intl.DateFormat.y();
        compactDateFormat = intl.DateFormat.yMd();
        shortDateFormat = intl.DateFormat.yMMMd();
        mediumDateFormat = intl.DateFormat.MMMEd();
        longDateFormat = intl.DateFormat.yMMMMEEEEd();
        yearMonthFormat = intl.DateFormat.yMMMM();
        shortMonthDayFormat = intl.DateFormat.MMMd();
      }

      intl.NumberFormat decimalFormat;
      intl.NumberFormat twoDigitZeroPaddedFormat;
      if (intl.NumberFormat.localeExists(localeName)) {
        decimalFormat = intl.NumberFormat.decimalPattern(localeName);
        twoDigitZeroPaddedFormat = intl.NumberFormat('00', localeName);
      } else if (intl.NumberFormat.localeExists(locale.languageCode)) {
        decimalFormat = intl.NumberFormat.decimalPattern(locale.languageCode);
        twoDigitZeroPaddedFormat = intl.NumberFormat('00', locale.languageCode);
      } else {
        decimalFormat = intl.NumberFormat.decimalPattern();
        twoDigitZeroPaddedFormat = intl.NumberFormat('00');
      }

      return SynchronousFuture<MaterialLocalizations>(getMaterialTranslation(
        locale,
        fullYearFormat,
        compactDateFormat,
        shortDateFormat,
        mediumDateFormat,
        longDateFormat,
        shortMonthDayFormat,
        yearMonthFormat,
        decimalFormat,
        twoDigitZeroPaddedFormat,
      ));
    });
  }

  @override
  bool shouldReload(BsMaterialLocalizationsDelegate old) => false;
}

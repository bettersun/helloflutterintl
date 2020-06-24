import 'dart:ui';

class LocaleConst {
  LocaleConst();

  static const String _languageZh = 'zh';
  static const String _languageEn = 'en';
  static const String _languageJa = 'ja';

  static const String _countryAreaCn = 'CN';
  static const String _countryAreaHk = 'HK';

  /// zh_CN: 简体中文（中国大陆）
  static const Locale zhCN = Locale(_languageZh, _countryAreaCn);

  /// zh_HK: 繁体中文（中国香港）
  static const Locale zhHK = Locale(_languageZh, _countryAreaHk);

  /// en: 英语
  static const Locale en = Locale(_languageEn);

  /// ja: 日语
  static const Locale ja = Locale(_languageJa);
}

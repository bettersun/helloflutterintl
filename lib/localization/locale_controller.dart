import 'package:flutter/material.dart';

typedef ChangeLocaleCallback = void Function(Locale locale);

/// 多语言切换
class LocaleController {
  /// 语言切换回调方法
  ChangeLocaleCallback onLocaleChanged;

  /// Internals
  static final LocaleController _localeController = LocaleController._internal();

  factory LocaleController() {
    return _localeController;
  }

  LocaleController._internal();
}

/// 语言切换控制器实例
LocaleController localeController = LocaleController();

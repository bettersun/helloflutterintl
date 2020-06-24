import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bs_home.dart';
import 'localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BsApp());
}

class BsApp extends StatefulWidget {
  @override
  _BsAppState createState() => _BsAppState();
}

class _BsAppState extends State<BsApp> {
  // 语言委托
  // App用
  BsMessageLocalDelegate _bsMessageLocalDelegate;
  // iOS用
  BsCupertinoLocalDelegate _bsCupertinoLocalDelegate;
  // 系统共通用（复制、粘贴等）
  BsMaterialLocalizationsDelegate _bsMaterialLocalizationsDelegate;

  @override
  void initState() {
    super.initState();

    // 语言地区
    const Locale locale = LocaleConst.zhCN;
    // 语言委托初始化
    _bsMessageLocalDelegate = const BsMessageLocalDelegate(locale);
    _bsCupertinoLocalDelegate = const BsCupertinoLocalDelegate(locale);
    _bsMaterialLocalizationsDelegate = const BsMaterialLocalizationsDelegate(locale);
    // 语言切换回调方法
    // 绑定全局事件用来更改App的State
    localeController.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale newLocale) {
    setState(() {
      // 语言切换
      _bsMessageLocalDelegate = BsMessageLocalDelegate(newLocale);
      _bsCupertinoLocalDelegate = BsCupertinoLocalDelegate(newLocale);
      _bsMaterialLocalizationsDelegate = BsMaterialLocalizationsDelegate(newLocale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ', // 这个地方多语言Message还未加载,无法使用Message响应多语言
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 语言委托
      localizationsDelegates: [
        _bsMessageLocalDelegate,
        _bsCupertinoLocalDelegate,
        _bsMaterialLocalizationsDelegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // 支持的语言
      supportedLocales: const <Locale>[
        LocaleConst.zhCN,
        LocaleConst.zhHK,
        LocaleConst.en,
        LocaleConst.en,
      ],
      home: const BsHome(),
    );
  }
}

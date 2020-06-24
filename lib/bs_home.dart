import 'package:flutter/material.dart';

import 'localization/localization.dart';

class BsHome extends StatefulWidget {
  const BsHome({Key key}) : super(key: key);

  @override
  _BsHomeState createState() => _BsHomeState();
}

class _BsHomeState extends State<BsHome> {
  int _localeIndex = 0;
  final int _localeTotal = 4;

  /// 切换语言
  Future<void> _changeLocale() async {
    _localeIndex++;

    Locale locale = LocaleConst.zhCN;
    // 切换语言
    if (_localeIndex % _localeTotal == 0) {
      locale = LocaleConst.zhCN;
    }
    if (_localeIndex % _localeTotal == 1) {
      locale = LocaleConst.zhHK;
    }
    if (_localeIndex % _localeTotal == 2) {
      locale = LocaleConst.en;
    }
    if (_localeIndex % _localeTotal == 3) {
      locale = LocaleConst.ja;
    }

    // 切换语言
    // 调用全局事件触发启动App里的setState
    localeController.onLocaleChanged(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Message.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Message.of(context).appName,
            ),
            Text(
              Message.of(context).author,
            ),
            Container(
              height: 8.0,
            ),
            FlatButton(
              child: Text(Message.of(context).changeLocale),
              onPressed: () async {
                await _changeLocale();
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

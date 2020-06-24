# helloflutterintl

A flutter intl example

## 配置

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.9.1+hotfix.6, on Mac OS X 10.13.6 17G7024, locale zh-Hans-CN)

[!] Android toolchain - develop for Android devices (Android SDK version 28.0.3)
    ! Some Android licenses not accepted.  To resolve this, run: flutter doctor --android-licenses
[✓] Xcode - develop for iOS and macOS (Xcode 10.1)
[✓] Android Studio (version 3.4)
[✓] VS Code (version 1.40.0)
[!] Connected device
    ! No devices available

! Doctor found issues in 2 categories.

```

```
$ flutter doctor --android-licenses
Warning: File /Users/sunjiashu/.android/repositories.cfg could not be loaded.
1 of 7 SDK package license not accepted.] 100% Computing updates...
Review license that has not been accepted (y/N)?

```

指定版本容易发生版本冲突，索性省略版本。
```
  flutter_localizations:
    sdk: flutter
  flutter_cupertino_localizations:
  intl:
  intl_translation:
```

工程目录下执行，生成arb文件(默认: intl_messages.arb)
```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/localization lib/localization/message.dart
```
各语言执行命令，生成dart文件
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/localization    --no-use-deferred-loading lib/localization/message.dart lib/localization/message_zh.arb
```
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/localization    --no-use-deferred-loading lib/localization/message.dart lib/localization/message_en.arb
```

在messsages_all.dart里添加各语言对应的变量
```
import 'messages_en.dart' as messages_en;
import 'messages_ja.dart' as messages_ja;
import 'messages_zh_CN.dart' as messages_zh_cn;
import 'messages_zh_HK.dart' as messages_zh_hk;

typedef Future<dynamic> LibraryLoader();

Map<String, LibraryLoader> _deferredLibraries = {
  'zh_CN': () => Future<LibraryLoader>.value(null),
  'zh_HK': () => Future<LibraryLoader>.value(null),
  'en': () => Future<LibraryLoader>.value(null),
  'ja': () => Future<LibraryLoader>.value(null),
};

MessageLookupByLibrary _findExact(String localeName) {
  switch (localeName) {
    case 'zh_CN':
      return messages_zh_cn.messages;
    case 'zh_HK':
      return messages_zh_hk.messages;
    case 'en':
      return messages_en.messages;
    case 'ja':
      return messages_ja.messages;
    default:
      return null;
  }
}
```

定义全局语言切换Controller(locale_controller.dart)

定义多语言委托  
BsMessageLocalDelegate  
BsCupertinoLocalDelegate  
BsMaterialLocalizationsDelegate  

启动App里初始化多语言委托,并绑定全局事件用来更改App的State  
切换语言事件里调用全局事件触发启动App里的setState
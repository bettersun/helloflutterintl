// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_HK locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

import 'locale_const.dart';

final MessageLookup messages = MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  // 必须和指定的地区语言一致
  String get localeName => LocaleConst.zhHK.toString();

  @override
  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(dynamic _) => <String, Function>{
        'appName': MessageLookupByLibrary.simpleMessage('應用名'),
        'author': MessageLookupByLibrary.simpleMessage('作者'),
        'title': MessageLookupByLibrary.simpleMessage('標題'),
        'changeLocale': MessageLookupByLibrary.simpleMessage('切換語言')
      };
}

import 'dart:ui';
import 'package:get/get.dart';
import 'en.dart';
import 'vi.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static const fallbackLocale = Locale('vi');
  static const List<Locale> appSupportedLocales = [
  Locale('vi'),
  Locale('en'),
];
  @override
  Map<String, Map<String, String>> get keys => {
        'vi': vi,
        'en': en,
      };
}

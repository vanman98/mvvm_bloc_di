import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:temp_package_name/presentation/resource/theme/theme_manager/theme_manager.dart';

class AppPrefs {
  AppPrefs._();

  static final AppPrefs _instance = AppPrefs._();

  factory AppPrefs() => _instance;
  static late Box box;
  final _encryptionKey = base64Url.decode(
    const String.fromEnvironment(
      'SECRET_KEY',
      defaultValue: 'jgGYXtQC6hIAROYyI_bbBZu4jFVHiqUICSf8yN2zp_8=',
    ),
  );
  bool _initialized = false;

  initialize() async {
    if (_initialized) return;

    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDocDirectory.path);
    }
    // Hive.registerAdapter(UserModelAdapter());
    box = await Hive.openBox(
      'AppPref',
      encryptionCipher: HiveAesCipher(_encryptionKey),
    );
    _initialized = true;
  }

  Stream watch(key) => box.watch(key: key);

  void clear() {
    box.deleteAll(['accessToken']);
  }

  static set accessToken(String? value) => box.put('accessToken', value);

  static String? get accessToken => box.get('accessToken');

  static set themeMode(String? value) => box.put('theme', value);

  static String? get themeMode => box.get('theme')??ThemeManager.lightMode;

  // set userData(UserModel? value) => box.add(value);

  // UserModel? get userData => box.getAt(0);
}

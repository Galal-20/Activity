
import 'dart:ui';

import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode _currentTheme = ThemeMode.system;
  Locale _locale = Locale('en');


  Locale get locale => _locale;
  ThemeMode get themeMode => _currentTheme;

  void changeApplicationTheme(ThemeMode newTheme){
    if(newTheme == _currentTheme) return;
    _currentTheme = newTheme;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('es'),
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'es':
        return 'Spanish';
      default:
        return '';
    }
  }
}
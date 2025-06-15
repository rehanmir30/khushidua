import 'dart:ui';

import 'package:get/get.dart';

import '../constants/translations.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => AppTranslations.translations;

// List of supported locales

  static final locales = [
    Locale('Arabic', 'Arabic'),
    Locale('Bengali', 'Bengali'),
    Locale('English', 'English'),
    Locale('French', 'French'),
    Locale('German', 'German'),
    Locale('Gujarati', 'Gujarati'),
    Locale('Hindi', 'Hindi'),
    Locale('Indonesian', 'Indonesian'),
    Locale('Japanese', 'Japanese'),
    Locale('Malay', 'Malay'),
    Locale('Mandarin', 'Mandarin'),
    Locale('Marathi', 'Marathi'),
    Locale('Portuguese', 'Portuguese'),
    Locale('Punjabi', 'Punjabi'),
    Locale('Russian', 'Russian'),
    Locale('Sindhi', 'Sindhi'),
    Locale('Spanish', 'Spanish'),
    Locale('Tamil', 'Tamil'),
    Locale('Telugu', 'Telugu'),
    Locale('Turkish', 'Turkish'),
    Locale('Urdu', 'Urdu'),
  ];
  // static final locales = [
  //   {'locale': Locale('ar', 'ar'), 'name': 'Arabic'},
  //   {'locale': Locale('bn', 'bn'), 'name': 'Bengali'},
  //   {'locale': Locale('en', 'en'), 'name': 'English'},
  //   {'locale': Locale('fr', 'fr'), 'name': 'French'},
  //   {'locale': Locale('de', 'de'), 'name': 'German'},
  //   {'locale': Locale('gu', 'gu'), 'name': 'Gujarati'},
  //   {'locale': Locale('hi', 'hi'), 'name': 'Hindi'},
  //   {'locale': Locale('id', 'id'), 'name': 'Indonesian'},
  //   {'locale': Locale('ja', 'ja'), 'name': 'Japanese'},
  //   {'locale': Locale('ms', 'ms'), 'name': 'Malay'},
  //   {'locale': Locale('zh', 'zh'), 'name': 'Chinese'},
  //   {'locale': Locale('mr', 'mr'), 'name': 'Marathi'},
  //   {'locale': Locale('pt', 'pt'), 'name': 'Portuguese'},
  //   {'locale': Locale('pa', 'pa'), 'name': 'Punjabi'},
  //   {'locale': Locale('ru', 'ru'), 'name': 'Russian'},
  //   {'locale': Locale('sd', 'sd'), 'name': 'Sindhi'},
  //   {'locale': Locale('es', 'es'), 'name': 'Spanish'},
  //   {'locale': Locale('ta', 'ta'), 'name': 'Tamil'},
  //   {'locale': Locale('te', 'te'), 'name': 'Telugu'},
  //   {'locale': Locale('tr', 'tr'), 'name': 'Turkish'},
  //   {'locale': Locale('ur', 'ur'), 'name': 'Urdu'},
  // ];


  // Function to change the locale
  static void changeLocale(String languageCode) {
    final locale = getLocaleFromLanguageCode(languageCode);
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  // Helper function to fetch Locale from language code
  static Locale? getLocaleFromLanguageCode(String languageCode) {
    for (Locale locale in locales) {
      if (locale.languageCode == languageCode) {
        return locale;
      }
    }
    return null;
  }

}
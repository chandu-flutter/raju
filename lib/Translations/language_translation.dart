import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'en_translation.dart';
import 'tel_translation.dart';

class LanguageTranslate extends Translations {
  GetStorage getStorage = GetStorage();

  void setLanguage(String code) {
    getStorage.write('activeLocal', code);
    Get.updateLocale(Locale(getStorage.read('activeLocal'), 'IN'));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': EnTranslation.keys,
        'te_IN': TelTranslation.keys,
        'hi_IN': EnTranslation.keys,
      };
}

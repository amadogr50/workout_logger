import 'dart:io';

class LocalesUtils {
  static String getCurrentLocale() {
    return Platform.localeName.split('_')[0];
  }
}

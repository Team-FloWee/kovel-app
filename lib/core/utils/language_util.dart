class LanguageUtil {
  String getLanguage(String language) {
    switch (language) {
      case 'en':
        return 'EngService1';
      default:
        return 'KorService1';
    }
  }
}

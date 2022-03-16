import 'dart:io';

class KeepLocalization {
  static late String locale;

  KeepLocalization() {
    locale = Platform.localeName.contains('ru')
        ? 'ru'
        : Platform.localeName.contains('uk')
            ? 'uk'
            : 'en';
  }
  String get weather => locale == 'uk'
      ? ("Погода")
      : locale == 'ru'
          ? ('Погода')
          : ('Weather');

  String get daysWeather => locale == 'uk'
      ? ("Погода на 8 днів")
      : locale == 'ru'
          ? ('Погода на 8 дней')
          : ('Weather for 8 days');

  String get hoursWeather => locale == 'uk'
      ? ("погода на 24 години")
      : locale == 'ru'
          ? ('погода на 24 часа')
          : ('weather for 24 hours');

  String get cancelText => locale == 'uk'
      ? ('Скасувати')
      : locale == 'ru'
          ? ('Отмена')
          : ('Cancel');

  String get submitText => locale == 'uk'
      ? ('Прийняти')
      : locale == 'ru'
          ? ('Принять')
          : ('Submit');

  String get deleteText => locale == 'uk'
      ? ('Видалити')
      : locale == 'ru'
          ? ('Удалить')
          : ('Remove');

  String get copyText => locale == 'uk'
      ? ('Копіювати')
      : locale == 'ru'
          ? ('Копировать')
          : ('Copy');

  String get pasteText => locale == 'uk'
      ? ('Вставити')
      : locale == 'ru'
          ? ('Вставить')
          : ('Paste');

  String get cutText => locale == 'uk'
      ? ('Вирізати')
      : locale == 'ru'
          ? ('Вырезать')
          : ('Cut');

  String get viewText => locale == 'uk'
      ? ('Проглянути')
      : locale == 'ru'
          ? ('Смотреть')
          : ('View');

  String get shareText => locale == 'uk'
      ? ('Поділитись')
      : locale == 'ru'
          ? ('Поделиться')
          : ('Share');
}

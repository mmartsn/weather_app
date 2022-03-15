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

  String get daysWeather => locale == 'uk'
      ? ("Погода на п'ять днів")
      : locale == 'ru'
          ? ('Погода на пять дней')
          : ('Weather for five days');

  String get hoursWeather => locale == 'uk'
      ? ("погода сьогодні")
      : locale == 'ru'
          ? ('погода сегодня')
          : ('weather today');

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

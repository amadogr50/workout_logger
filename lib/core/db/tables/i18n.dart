import 'package:moor/moor.dart';

class I18n extends Table {
  IntColumn get id => integer().autoIncrement()();
}

class Translations extends Table {
  IntColumn get i18nId =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  IntColumn get localeId =>
      integer().customConstraint('NULL REFERENCES locales(id)')();

  TextColumn get textTranslation => text()();

  @override
  Set<Column> get primaryKey => {i18nId, localeId};
}

class Locales extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get locale => text()();
}

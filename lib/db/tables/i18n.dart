import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class I18n extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  @override
  Set<Column>? get primaryKey => {id};
}

class Translations extends Table {
  TextColumn get i18nId =>
      text().customConstraint('NULL REFERENCES i18n(id)')();

  TextColumn get localeId =>
      text().customConstraint('NULL REFERENCES locales(id)')();

  TextColumn get textTranslation => text()();

  @override
  Set<Column> get primaryKey => {i18nId, localeId};
}

class Locales extends Table {
  TextColumn get locale => text()();

  @override
  Set<Column>? get primaryKey => {locale};
}

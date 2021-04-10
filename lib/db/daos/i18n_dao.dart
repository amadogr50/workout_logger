import 'package:moor/moor.dart';
import 'package:workout_logger/core/locales_utils.dart';
import 'package:workout_logger/db/tables/i18n.dart';

import '../db.dart';

part 'i18n_dao.g.dart';

@UseDao(
  tables: [I18n, Translations, Locales],
)
class I18nDao extends DatabaseAccessor<MyDatabase> with _$I18nDaoMixin {
  I18nDao(MyDatabase db) : super(db);

  Future<int> addTranslation(String translation) async {
    final int i18nId = await into(i18n).insert(const I18nCompanion());
    final int localeId = await getLocaleOrAdd();

    await into(translations).insert(TranslationsCompanion(
      i18nId: Value(i18nId),
      localeId: Value(localeId),
      textTranslation: Value(translation),
    ));

    return i18nId;
  }

  Future<int> updateTranslation({
    required int i18nId,
    required String translation,
  }) async {
    return transaction(() async {
      final int localeId = await getLocaleOrAdd();

      await into(translations).insertOnConflictUpdate(TranslationsCompanion(
        i18nId: Value(i18nId),
        localeId: Value(localeId),
        textTranslation: Value(translation),
      ));

      return i18nId;
    });
  }

  Future<String> getTranslation(int i18nId) async {
    final localeId = await getLocale();
    final translationModel = await (select(translations)
          ..where((t) => t.i18nId.equals(i18nId) & t.localeId.equals(localeId)))
        .getSingle();
    return translationModel.textTranslation;
  }

  Future<int> addLocale(String locale) async {
    return into(locales).insert(LocalesCompanion(locale: Value(locale)));
  }

  Future<int> getLocale() async {
    Locale? localeModel = await (select(locales)
          ..where((t) => t.locale.equals(LocalesUtils.getCurrentLocale())))
        .getSingleOrNull();

    localeModel ??= await (select(locales)..where((t) => t.locale.equals('en')))
        .getSingle();

    return localeModel.id;
  }

  Future<int> getLocaleOrAdd() async {
    Locale? localeModel = await (select(locales)
          ..where((t) => t.locale.equals(LocalesUtils.getCurrentLocale())))
        .getSingleOrNull();
    if (localeModel == null) {
      final int localeId = await addLocale(LocalesUtils.getCurrentLocale());
      localeModel = await (select(locales)..where((t) => t.id.equals(localeId)))
          .getSingle();
    }

    return localeModel.id;
  }
}

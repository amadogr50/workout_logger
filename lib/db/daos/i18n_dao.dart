import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_logger/core/locales_utils.dart';
import 'package:workout_logger/db/tables/i18n.dart';

import '../db.dart';

part 'i18n_dao.g.dart';

@UseDao(
  tables: [I18n, Translations, Locales],
)
class I18nDao extends DatabaseAccessor<MyDatabase> with _$I18nDaoMixin {
  I18nDao(MyDatabase db) : super(db);

  Future<String> addTranslation(String translation) async {
    final String i18nId =
        await into(i18n).insert(const I18nCompanion()) as String;
    final String localeId = await getLocaleOrAdd();

    await into(translations).insert(TranslationsCompanion(
      i18nId: Value(i18nId),
      localeId: Value(localeId),
      textTranslation: Value(translation),
    ));

    return i18nId;
  }

  Future<String> updateTranslation({
    required String i18nId,
    required String translation,
  }) async {
    return transaction(() async {
      final String localeId = await getLocaleOrAdd();

      await into(translations).insertOnConflictUpdate(TranslationsCompanion(
        i18nId: Value(i18nId),
        localeId: Value(localeId),
        textTranslation: Value(translation),
      ));

      return i18nId;
    });
  }

  Future<String> getTranslation(String i18nId) async {
    final localeId = await getLocale();
    final translationModel = await (select(translations)
          ..where((t) => t.i18nId.equals(i18nId) & t.localeId.equals(localeId)))
        .getSingle();
    return translationModel.textTranslation;
  }

  Stream<String> watchTranslation(String i18nId) {
    final localeIdStream = watchLocale();

    return localeIdStream.switchMap((localeId) {
      final translationModelStream = (select(translations)
            ..where(
                (t) => t.i18nId.equals(i18nId) & t.localeId.equals(localeId)))
          .watchSingle();
      return translationModelStream
          .map((translationModel) => translationModel.textTranslation);
    });
  }

  Stream<Map<String, String>> watchTranslations(List<String> i18nIds) {
    final localeIdStream = watchLocale();

    return localeIdStream.switchMap((localeId) {
      final translationsModelsStream = (select(translations)
            ..where(
                (t) => t.i18nId.isIn(i18nIds) & t.localeId.equals(localeId)))
          .watch();

      return translationsModelsStream.map((translationsModels) {
        return {
          for (var translationModel in translationsModels)
            translationModel.i18nId: translationModel.textTranslation
        };
      });
    });
  }

  Future<String> addLocale(String locale) async {
    return into(locales).insert(LocalesCompanion(locale: Value(locale)))
        as Future<String>;
  }

  Future<String> getLocale() async {
    Locale? localeModel = await (select(locales)
          ..where((t) => t.locale.equals(LocalesUtils.getCurrentLocale())))
        .getSingleOrNull();

    localeModel ??= await (select(locales)..where((t) => t.locale.equals('en')))
        .getSingle();

    return localeModel.locale;
  }

  Stream<String> watchLocale() {
    final currentLocale = LocalesUtils.getCurrentLocale();

    final Stream<List<Locale>> localesModelsStream = (select(locales)
          ..where(
            (t) => t.locale.equals(currentLocale) | t.locale.equals('en'),
          ))
        .watch();

    return localesModelsStream.map((localesModels) {
      if (localesModels.length == 2) {
        return localesModels
            .firstWhere((localeModel) => localeModel.locale == currentLocale)
            .locale;
      }

      return localesModels.first.locale;
    });
  }

  Future<String> getLocaleOrAdd() async {
    Locale? localeModel = await (select(locales)
          ..where((t) => t.locale.equals(LocalesUtils.getCurrentLocale())))
        .getSingleOrNull();
    if (localeModel == null) {
      final String localeId = await addLocale(LocalesUtils.getCurrentLocale());
      localeModel = await (select(locales)
            ..where((t) => t.locale.equals(localeId)))
          .getSingle();
    }

    return localeModel.locale;
  }
}

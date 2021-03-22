// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class I18nData extends DataClass implements Insertable<I18nData> {
  final int id;
  I18nData({@required this.id});
  factory I18nData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return I18nData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    return map;
  }

  I18nCompanion toCompanion(bool nullToAbsent) {
    return I18nCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory I18nData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return I18nData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  I18nData copyWith({int id}) => I18nData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('I18nData(')..write('id: $id')..write(')')).toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || (other is I18nData && other.id == this.id);
}

class I18nCompanion extends UpdateCompanion<I18nData> {
  final Value<int> id;
  const I18nCompanion({
    this.id = const Value.absent(),
  });
  I18nCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<I18nData> custom({
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  I18nCompanion copyWith({Value<int> id}) {
    return I18nCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('I18nCompanion(')..write('id: $id')..write(')'))
        .toString();
  }
}

class $I18nTable extends I18n with TableInfo<$I18nTable, I18nData> {
  final GeneratedDatabase _db;
  final String _alias;
  $I18nTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  $I18nTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'i18n';
  @override
  final String actualTableName = 'i18n';
  @override
  VerificationContext validateIntegrity(Insertable<I18nData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  I18nData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return I18nData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $I18nTable createAlias(String alias) {
    return $I18nTable(_db, alias);
  }
}

class Translation extends DataClass implements Insertable<Translation> {
  final int id;
  final int i18nId;
  final int localeId;
  final String textTranslation;
  Translation(
      {@required this.id,
      @required this.i18nId,
      @required this.localeId,
      @required this.textTranslation});
  factory Translation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Translation(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      i18nId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_id']),
      localeId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}locale_id']),
      textTranslation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}text_translation']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || i18nId != null) {
      map['i18n_id'] = Variable<int>(i18nId);
    }
    if (!nullToAbsent || localeId != null) {
      map['locale_id'] = Variable<int>(localeId);
    }
    if (!nullToAbsent || textTranslation != null) {
      map['text_translation'] = Variable<String>(textTranslation);
    }
    return map;
  }

  TranslationsCompanion toCompanion(bool nullToAbsent) {
    return TranslationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      i18nId:
          i18nId == null && nullToAbsent ? const Value.absent() : Value(i18nId),
      localeId: localeId == null && nullToAbsent
          ? const Value.absent()
          : Value(localeId),
      textTranslation: textTranslation == null && nullToAbsent
          ? const Value.absent()
          : Value(textTranslation),
    );
  }

  factory Translation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Translation(
      id: serializer.fromJson<int>(json['id']),
      i18nId: serializer.fromJson<int>(json['i18nId']),
      localeId: serializer.fromJson<int>(json['localeId']),
      textTranslation: serializer.fromJson<String>(json['textTranslation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'i18nId': serializer.toJson<int>(i18nId),
      'localeId': serializer.toJson<int>(localeId),
      'textTranslation': serializer.toJson<String>(textTranslation),
    };
  }

  Translation copyWith(
          {int id, int i18nId, int localeId, String textTranslation}) =>
      Translation(
        id: id ?? this.id,
        i18nId: i18nId ?? this.i18nId,
        localeId: localeId ?? this.localeId,
        textTranslation: textTranslation ?? this.textTranslation,
      );
  @override
  String toString() {
    return (StringBuffer('Translation(')
          ..write('id: $id, ')
          ..write('i18nId: $i18nId, ')
          ..write('localeId: $localeId, ')
          ..write('textTranslation: $textTranslation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(i18nId.hashCode,
          $mrjc(localeId.hashCode, textTranslation.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Translation &&
          other.id == this.id &&
          other.i18nId == this.i18nId &&
          other.localeId == this.localeId &&
          other.textTranslation == this.textTranslation);
}

class TranslationsCompanion extends UpdateCompanion<Translation> {
  final Value<int> id;
  final Value<int> i18nId;
  final Value<int> localeId;
  final Value<String> textTranslation;
  const TranslationsCompanion({
    this.id = const Value.absent(),
    this.i18nId = const Value.absent(),
    this.localeId = const Value.absent(),
    this.textTranslation = const Value.absent(),
  });
  TranslationsCompanion.insert({
    this.id = const Value.absent(),
    @required int i18nId,
    @required int localeId,
    @required String textTranslation,
  })  : i18nId = Value(i18nId),
        localeId = Value(localeId),
        textTranslation = Value(textTranslation);
  static Insertable<Translation> custom({
    Expression<int> id,
    Expression<int> i18nId,
    Expression<int> localeId,
    Expression<String> textTranslation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (i18nId != null) 'i18n_id': i18nId,
      if (localeId != null) 'locale_id': localeId,
      if (textTranslation != null) 'text_translation': textTranslation,
    });
  }

  TranslationsCompanion copyWith(
      {Value<int> id,
      Value<int> i18nId,
      Value<int> localeId,
      Value<String> textTranslation}) {
    return TranslationsCompanion(
      id: id ?? this.id,
      i18nId: i18nId ?? this.i18nId,
      localeId: localeId ?? this.localeId,
      textTranslation: textTranslation ?? this.textTranslation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (i18nId.present) {
      map['i18n_id'] = Variable<int>(i18nId.value);
    }
    if (localeId.present) {
      map['locale_id'] = Variable<int>(localeId.value);
    }
    if (textTranslation.present) {
      map['text_translation'] = Variable<String>(textTranslation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationsCompanion(')
          ..write('id: $id, ')
          ..write('i18nId: $i18nId, ')
          ..write('localeId: $localeId, ')
          ..write('textTranslation: $textTranslation')
          ..write(')'))
        .toString();
  }
}

class $TranslationsTable extends Translations
    with TableInfo<$TranslationsTable, Translation> {
  final GeneratedDatabase _db;
  final String _alias;
  $TranslationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _i18nIdMeta = const VerificationMeta('i18nId');
  GeneratedIntColumn _i18nId;
  @override
  GeneratedIntColumn get i18nId => _i18nId ??= _constructI18nId();
  GeneratedIntColumn _constructI18nId() {
    return GeneratedIntColumn('i18n_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  final VerificationMeta _localeIdMeta = const VerificationMeta('localeId');
  GeneratedIntColumn _localeId;
  @override
  GeneratedIntColumn get localeId => _localeId ??= _constructLocaleId();
  GeneratedIntColumn _constructLocaleId() {
    return GeneratedIntColumn('locale_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES locales(id)');
  }

  final VerificationMeta _textTranslationMeta =
      const VerificationMeta('textTranslation');
  GeneratedTextColumn _textTranslation;
  @override
  GeneratedTextColumn get textTranslation =>
      _textTranslation ??= _constructTextTranslation();
  GeneratedTextColumn _constructTextTranslation() {
    return GeneratedTextColumn(
      'text_translation',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, i18nId, localeId, textTranslation];
  @override
  $TranslationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'translations';
  @override
  final String actualTableName = 'translations';
  @override
  VerificationContext validateIntegrity(Insertable<Translation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('i18n_id')) {
      context.handle(_i18nIdMeta,
          i18nId.isAcceptableOrUnknown(data['i18n_id'], _i18nIdMeta));
    } else if (isInserting) {
      context.missing(_i18nIdMeta);
    }
    if (data.containsKey('locale_id')) {
      context.handle(_localeIdMeta,
          localeId.isAcceptableOrUnknown(data['locale_id'], _localeIdMeta));
    } else if (isInserting) {
      context.missing(_localeIdMeta);
    }
    if (data.containsKey('text_translation')) {
      context.handle(
          _textTranslationMeta,
          textTranslation.isAcceptableOrUnknown(
              data['text_translation'], _textTranslationMeta));
    } else if (isInserting) {
      context.missing(_textTranslationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Translation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Translation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TranslationsTable createAlias(String alias) {
    return $TranslationsTable(_db, alias);
  }
}

class Locale extends DataClass implements Insertable<Locale> {
  final int id;
  final String locale;
  Locale({@required this.id, @required this.locale});
  factory Locale.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Locale(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      locale:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}locale']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || locale != null) {
      map['locale'] = Variable<String>(locale);
    }
    return map;
  }

  LocalesCompanion toCompanion(bool nullToAbsent) {
    return LocalesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      locale:
          locale == null && nullToAbsent ? const Value.absent() : Value(locale),
    );
  }

  factory Locale.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Locale(
      id: serializer.fromJson<int>(json['id']),
      locale: serializer.fromJson<String>(json['locale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locale': serializer.toJson<String>(locale),
    };
  }

  Locale copyWith({int id, String locale}) => Locale(
        id: id ?? this.id,
        locale: locale ?? this.locale,
      );
  @override
  String toString() {
    return (StringBuffer('Locale(')
          ..write('id: $id, ')
          ..write('locale: $locale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, locale.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Locale && other.id == this.id && other.locale == this.locale);
}

class LocalesCompanion extends UpdateCompanion<Locale> {
  final Value<int> id;
  final Value<String> locale;
  const LocalesCompanion({
    this.id = const Value.absent(),
    this.locale = const Value.absent(),
  });
  LocalesCompanion.insert({
    this.id = const Value.absent(),
    @required String locale,
  }) : locale = Value(locale);
  static Insertable<Locale> custom({
    Expression<int> id,
    Expression<String> locale,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locale != null) 'locale': locale,
    });
  }

  LocalesCompanion copyWith({Value<int> id, Value<String> locale}) {
    return LocalesCompanion(
      id: id ?? this.id,
      locale: locale ?? this.locale,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalesCompanion(')
          ..write('id: $id, ')
          ..write('locale: $locale')
          ..write(')'))
        .toString();
  }
}

class $LocalesTable extends Locales with TableInfo<$LocalesTable, Locale> {
  final GeneratedDatabase _db;
  final String _alias;
  $LocalesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _localeMeta = const VerificationMeta('locale');
  GeneratedTextColumn _locale;
  @override
  GeneratedTextColumn get locale => _locale ??= _constructLocale();
  GeneratedTextColumn _constructLocale() {
    return GeneratedTextColumn(
      'locale',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, locale];
  @override
  $LocalesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'locales';
  @override
  final String actualTableName = 'locales';
  @override
  VerificationContext validateIntegrity(Insertable<Locale> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale'], _localeMeta));
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Locale map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Locale.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LocalesTable createAlias(String alias) {
    return $LocalesTable(_db, alias);
  }
}

class ExerciseModel extends DataClass implements Insertable<ExerciseModel> {
  final int id;
  final int exerciseTypeId;
  final int equipmentId;
  final int i18nName;
  final String instructions;
  ExerciseModel(
      {@required this.id,
      @required this.exerciseTypeId,
      @required this.equipmentId,
      @required this.i18nName,
      this.instructions});
  factory ExerciseModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ExerciseModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      exerciseTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_type_id']),
      equipmentId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}equipment_id']),
      i18nName:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_name']),
      instructions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}instructions']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || exerciseTypeId != null) {
      map['exercise_type_id'] = Variable<int>(exerciseTypeId);
    }
    if (!nullToAbsent || equipmentId != null) {
      map['equipment_id'] = Variable<int>(equipmentId);
    }
    if (!nullToAbsent || i18nName != null) {
      map['i18n_name'] = Variable<int>(i18nName);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    return map;
  }

  ExercisesModelCompanion toCompanion(bool nullToAbsent) {
    return ExercisesModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      exerciseTypeId: exerciseTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseTypeId),
      equipmentId: equipmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(equipmentId),
      i18nName: i18nName == null && nullToAbsent
          ? const Value.absent()
          : Value(i18nName),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
    );
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseModel(
      id: serializer.fromJson<int>(json['id']),
      exerciseTypeId: serializer.fromJson<int>(json['exerciseTypeId']),
      equipmentId: serializer.fromJson<int>(json['equipmentId']),
      i18nName: serializer.fromJson<int>(json['i18nName']),
      instructions: serializer.fromJson<String>(json['instructions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseTypeId': serializer.toJson<int>(exerciseTypeId),
      'equipmentId': serializer.toJson<int>(equipmentId),
      'i18nName': serializer.toJson<int>(i18nName),
      'instructions': serializer.toJson<String>(instructions),
    };
  }

  ExerciseModel copyWith(
          {int id,
          int exerciseTypeId,
          int equipmentId,
          int i18nName,
          String instructions}) =>
      ExerciseModel(
        id: id ?? this.id,
        exerciseTypeId: exerciseTypeId ?? this.exerciseTypeId,
        equipmentId: equipmentId ?? this.equipmentId,
        i18nName: i18nName ?? this.i18nName,
        instructions: instructions ?? this.instructions,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseModel(')
          ..write('id: $id, ')
          ..write('exerciseTypeId: $exerciseTypeId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('i18nName: $i18nName, ')
          ..write('instructions: $instructions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          exerciseTypeId.hashCode,
          $mrjc(equipmentId.hashCode,
              $mrjc(i18nName.hashCode, instructions.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseModel &&
          other.id == this.id &&
          other.exerciseTypeId == this.exerciseTypeId &&
          other.equipmentId == this.equipmentId &&
          other.i18nName == this.i18nName &&
          other.instructions == this.instructions);
}

class ExercisesModelCompanion extends UpdateCompanion<ExerciseModel> {
  final Value<int> id;
  final Value<int> exerciseTypeId;
  final Value<int> equipmentId;
  final Value<int> i18nName;
  final Value<String> instructions;
  const ExercisesModelCompanion({
    this.id = const Value.absent(),
    this.exerciseTypeId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.i18nName = const Value.absent(),
    this.instructions = const Value.absent(),
  });
  ExercisesModelCompanion.insert({
    this.id = const Value.absent(),
    @required int exerciseTypeId,
    @required int equipmentId,
    @required int i18nName,
    this.instructions = const Value.absent(),
  })  : exerciseTypeId = Value(exerciseTypeId),
        equipmentId = Value(equipmentId),
        i18nName = Value(i18nName);
  static Insertable<ExerciseModel> custom({
    Expression<int> id,
    Expression<int> exerciseTypeId,
    Expression<int> equipmentId,
    Expression<int> i18nName,
    Expression<String> instructions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseTypeId != null) 'exercise_type_id': exerciseTypeId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (i18nName != null) 'i18n_name': i18nName,
      if (instructions != null) 'instructions': instructions,
    });
  }

  ExercisesModelCompanion copyWith(
      {Value<int> id,
      Value<int> exerciseTypeId,
      Value<int> equipmentId,
      Value<int> i18nName,
      Value<String> instructions}) {
    return ExercisesModelCompanion(
      id: id ?? this.id,
      exerciseTypeId: exerciseTypeId ?? this.exerciseTypeId,
      equipmentId: equipmentId ?? this.equipmentId,
      i18nName: i18nName ?? this.i18nName,
      instructions: instructions ?? this.instructions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseTypeId.present) {
      map['exercise_type_id'] = Variable<int>(exerciseTypeId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (i18nName.present) {
      map['i18n_name'] = Variable<int>(i18nName.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesModelCompanion(')
          ..write('id: $id, ')
          ..write('exerciseTypeId: $exerciseTypeId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('i18nName: $i18nName, ')
          ..write('instructions: $instructions')
          ..write(')'))
        .toString();
  }
}

class $ExercisesModelTable extends ExercisesModel
    with TableInfo<$ExercisesModelTable, ExerciseModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _exerciseTypeIdMeta =
      const VerificationMeta('exerciseTypeId');
  GeneratedIntColumn _exerciseTypeId;
  @override
  GeneratedIntColumn get exerciseTypeId =>
      _exerciseTypeId ??= _constructExerciseTypeId();
  GeneratedIntColumn _constructExerciseTypeId() {
    return GeneratedIntColumn('exercise_type_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES exercises_types(id)');
  }

  final VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  GeneratedIntColumn _equipmentId;
  @override
  GeneratedIntColumn get equipmentId =>
      _equipmentId ??= _constructEquipmentId();
  GeneratedIntColumn _constructEquipmentId() {
    return GeneratedIntColumn('equipment_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES equipments(id)');
  }

  final VerificationMeta _i18nNameMeta = const VerificationMeta('i18nName');
  GeneratedIntColumn _i18nName;
  @override
  GeneratedIntColumn get i18nName => _i18nName ??= _constructI18nName();
  GeneratedIntColumn _constructI18nName() {
    return GeneratedIntColumn('i18n_name', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  final VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  GeneratedTextColumn _instructions;
  @override
  GeneratedTextColumn get instructions =>
      _instructions ??= _constructInstructions();
  GeneratedTextColumn _constructInstructions() {
    return GeneratedTextColumn(
      'instructions',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, exerciseTypeId, equipmentId, i18nName, instructions];
  @override
  $ExercisesModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises';
  @override
  final String actualTableName = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('exercise_type_id')) {
      context.handle(
          _exerciseTypeIdMeta,
          exerciseTypeId.isAcceptableOrUnknown(
              data['exercise_type_id'], _exerciseTypeIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseTypeIdMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id'], _equipmentIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('i18n_name')) {
      context.handle(_i18nNameMeta,
          i18nName.isAcceptableOrUnknown(data['i18n_name'], _i18nNameMeta));
    } else if (isInserting) {
      context.missing(_i18nNameMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions'], _instructionsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesModelTable createAlias(String alias) {
    return $ExercisesModelTable(_db, alias);
  }
}

class ExercisesTypeModel extends DataClass
    implements Insertable<ExercisesTypeModel> {
  final int id;
  final int i18nName;
  ExercisesTypeModel({@required this.id, @required this.i18nName});
  factory ExercisesTypeModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ExercisesTypeModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      i18nName:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || i18nName != null) {
      map['i18n_name'] = Variable<int>(i18nName);
    }
    return map;
  }

  ExercisesTypesModelCompanion toCompanion(bool nullToAbsent) {
    return ExercisesTypesModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      i18nName: i18nName == null && nullToAbsent
          ? const Value.absent()
          : Value(i18nName),
    );
  }

  factory ExercisesTypeModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExercisesTypeModel(
      id: serializer.fromJson<int>(json['id']),
      i18nName: serializer.fromJson<int>(json['i18nName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'i18nName': serializer.toJson<int>(i18nName),
    };
  }

  ExercisesTypeModel copyWith({int id, int i18nName}) => ExercisesTypeModel(
        id: id ?? this.id,
        i18nName: i18nName ?? this.i18nName,
      );
  @override
  String toString() {
    return (StringBuffer('ExercisesTypeModel(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, i18nName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExercisesTypeModel &&
          other.id == this.id &&
          other.i18nName == this.i18nName);
}

class ExercisesTypesModelCompanion extends UpdateCompanion<ExercisesTypeModel> {
  final Value<int> id;
  final Value<int> i18nName;
  const ExercisesTypesModelCompanion({
    this.id = const Value.absent(),
    this.i18nName = const Value.absent(),
  });
  ExercisesTypesModelCompanion.insert({
    this.id = const Value.absent(),
    @required int i18nName,
  }) : i18nName = Value(i18nName);
  static Insertable<ExercisesTypeModel> custom({
    Expression<int> id,
    Expression<int> i18nName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (i18nName != null) 'i18n_name': i18nName,
    });
  }

  ExercisesTypesModelCompanion copyWith({Value<int> id, Value<int> i18nName}) {
    return ExercisesTypesModelCompanion(
      id: id ?? this.id,
      i18nName: i18nName ?? this.i18nName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (i18nName.present) {
      map['i18n_name'] = Variable<int>(i18nName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesTypesModelCompanion(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTypesModelTable extends ExercisesTypesModel
    with TableInfo<$ExercisesTypesModelTable, ExercisesTypeModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesTypesModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _i18nNameMeta = const VerificationMeta('i18nName');
  GeneratedIntColumn _i18nName;
  @override
  GeneratedIntColumn get i18nName => _i18nName ??= _constructI18nName();
  GeneratedIntColumn _constructI18nName() {
    return GeneratedIntColumn('i18n_name', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, i18nName];
  @override
  $ExercisesTypesModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises_types';
  @override
  final String actualTableName = 'exercises_types';
  @override
  VerificationContext validateIntegrity(Insertable<ExercisesTypeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('i18n_name')) {
      context.handle(_i18nNameMeta,
          i18nName.isAcceptableOrUnknown(data['i18n_name'], _i18nNameMeta));
    } else if (isInserting) {
      context.missing(_i18nNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExercisesTypeModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExercisesTypeModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesTypesModelTable createAlias(String alias) {
    return $ExercisesTypesModelTable(_db, alias);
  }
}

class EquipmentModel extends DataClass implements Insertable<EquipmentModel> {
  final int id;
  final int i18nName;
  EquipmentModel({@required this.id, @required this.i18nName});
  factory EquipmentModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return EquipmentModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      i18nName:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || i18nName != null) {
      map['i18n_name'] = Variable<int>(i18nName);
    }
    return map;
  }

  EquipmentsModelCompanion toCompanion(bool nullToAbsent) {
    return EquipmentsModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      i18nName: i18nName == null && nullToAbsent
          ? const Value.absent()
          : Value(i18nName),
    );
  }

  factory EquipmentModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EquipmentModel(
      id: serializer.fromJson<int>(json['id']),
      i18nName: serializer.fromJson<int>(json['i18nName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'i18nName': serializer.toJson<int>(i18nName),
    };
  }

  EquipmentModel copyWith({int id, int i18nName}) => EquipmentModel(
        id: id ?? this.id,
        i18nName: i18nName ?? this.i18nName,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentModel(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, i18nName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EquipmentModel &&
          other.id == this.id &&
          other.i18nName == this.i18nName);
}

class EquipmentsModelCompanion extends UpdateCompanion<EquipmentModel> {
  final Value<int> id;
  final Value<int> i18nName;
  const EquipmentsModelCompanion({
    this.id = const Value.absent(),
    this.i18nName = const Value.absent(),
  });
  EquipmentsModelCompanion.insert({
    this.id = const Value.absent(),
    @required int i18nName,
  }) : i18nName = Value(i18nName);
  static Insertable<EquipmentModel> custom({
    Expression<int> id,
    Expression<int> i18nName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (i18nName != null) 'i18n_name': i18nName,
    });
  }

  EquipmentsModelCompanion copyWith({Value<int> id, Value<int> i18nName}) {
    return EquipmentsModelCompanion(
      id: id ?? this.id,
      i18nName: i18nName ?? this.i18nName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (i18nName.present) {
      map['i18n_name'] = Variable<int>(i18nName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentsModelCompanion(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }
}

class $EquipmentsModelTable extends EquipmentsModel
    with TableInfo<$EquipmentsModelTable, EquipmentModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $EquipmentsModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _i18nNameMeta = const VerificationMeta('i18nName');
  GeneratedIntColumn _i18nName;
  @override
  GeneratedIntColumn get i18nName => _i18nName ??= _constructI18nName();
  GeneratedIntColumn _constructI18nName() {
    return GeneratedIntColumn('i18n_name', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, i18nName];
  @override
  $EquipmentsModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'equipments';
  @override
  final String actualTableName = 'equipments';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('i18n_name')) {
      context.handle(_i18nNameMeta,
          i18nName.isAcceptableOrUnknown(data['i18n_name'], _i18nNameMeta));
    } else if (isInserting) {
      context.missing(_i18nNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EquipmentModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EquipmentsModelTable createAlias(String alias) {
    return $EquipmentsModelTable(_db, alias);
  }
}

class ExercisesMuscleModel extends DataClass
    implements Insertable<ExercisesMuscleModel> {
  final int exerciseId;
  final int muscleId;
  ExercisesMuscleModel({@required this.exerciseId, @required this.muscleId});
  factory ExercisesMuscleModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ExercisesMuscleModel(
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
      muscleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}muscle_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || muscleId != null) {
      map['muscle_id'] = Variable<int>(muscleId);
    }
    return map;
  }

  ExercisesMusclesModelCompanion toCompanion(bool nullToAbsent) {
    return ExercisesMusclesModelCompanion(
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      muscleId: muscleId == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleId),
    );
  }

  factory ExercisesMuscleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExercisesMuscleModel(
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      muscleId: serializer.fromJson<int>(json['muscleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<int>(exerciseId),
      'muscleId': serializer.toJson<int>(muscleId),
    };
  }

  ExercisesMuscleModel copyWith({int exerciseId, int muscleId}) =>
      ExercisesMuscleModel(
        exerciseId: exerciseId ?? this.exerciseId,
        muscleId: muscleId ?? this.muscleId,
      );
  @override
  String toString() {
    return (StringBuffer('ExercisesMuscleModel(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleId: $muscleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(exerciseId.hashCode, muscleId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExercisesMuscleModel &&
          other.exerciseId == this.exerciseId &&
          other.muscleId == this.muscleId);
}

class ExercisesMusclesModelCompanion
    extends UpdateCompanion<ExercisesMuscleModel> {
  final Value<int> exerciseId;
  final Value<int> muscleId;
  const ExercisesMusclesModelCompanion({
    this.exerciseId = const Value.absent(),
    this.muscleId = const Value.absent(),
  });
  ExercisesMusclesModelCompanion.insert({
    @required int exerciseId,
    @required int muscleId,
  })  : exerciseId = Value(exerciseId),
        muscleId = Value(muscleId);
  static Insertable<ExercisesMuscleModel> custom({
    Expression<int> exerciseId,
    Expression<int> muscleId,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (muscleId != null) 'muscle_id': muscleId,
    });
  }

  ExercisesMusclesModelCompanion copyWith(
      {Value<int> exerciseId, Value<int> muscleId}) {
    return ExercisesMusclesModelCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      muscleId: muscleId ?? this.muscleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (muscleId.present) {
      map['muscle_id'] = Variable<int>(muscleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesMusclesModelCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleId: $muscleId')
          ..write(')'))
        .toString();
  }
}

class $ExercisesMusclesModelTable extends ExercisesMusclesModel
    with TableInfo<$ExercisesMusclesModelTable, ExercisesMuscleModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesMusclesModelTable(this._db, [this._alias]);
  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  GeneratedIntColumn _exerciseId;
  @override
  GeneratedIntColumn get exerciseId => _exerciseId ??= _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES exercises(id)');
  }

  final VerificationMeta _muscleIdMeta = const VerificationMeta('muscleId');
  GeneratedIntColumn _muscleId;
  @override
  GeneratedIntColumn get muscleId => _muscleId ??= _constructMuscleId();
  GeneratedIntColumn _constructMuscleId() {
    return GeneratedIntColumn('muscle_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES muscles(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [exerciseId, muscleId];
  @override
  $ExercisesMusclesModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises_muscles';
  @override
  final String actualTableName = 'exercises_muscles';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExercisesMuscleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('muscle_id')) {
      context.handle(_muscleIdMeta,
          muscleId.isAcceptableOrUnknown(data['muscle_id'], _muscleIdMeta));
    } else if (isInserting) {
      context.missing(_muscleIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ExercisesMuscleModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExercisesMuscleModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesMusclesModelTable createAlias(String alias) {
    return $ExercisesMusclesModelTable(_db, alias);
  }
}

class MuscleModel extends DataClass implements Insertable<MuscleModel> {
  final int id;
  final int i18nName;
  MuscleModel({@required this.id, @required this.i18nName});
  factory MuscleModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return MuscleModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      i18nName:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || i18nName != null) {
      map['i18n_name'] = Variable<int>(i18nName);
    }
    return map;
  }

  MusclesModelCompanion toCompanion(bool nullToAbsent) {
    return MusclesModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      i18nName: i18nName == null && nullToAbsent
          ? const Value.absent()
          : Value(i18nName),
    );
  }

  factory MuscleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MuscleModel(
      id: serializer.fromJson<int>(json['id']),
      i18nName: serializer.fromJson<int>(json['i18nName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'i18nName': serializer.toJson<int>(i18nName),
    };
  }

  MuscleModel copyWith({int id, int i18nName}) => MuscleModel(
        id: id ?? this.id,
        i18nName: i18nName ?? this.i18nName,
      );
  @override
  String toString() {
    return (StringBuffer('MuscleModel(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, i18nName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MuscleModel &&
          other.id == this.id &&
          other.i18nName == this.i18nName);
}

class MusclesModelCompanion extends UpdateCompanion<MuscleModel> {
  final Value<int> id;
  final Value<int> i18nName;
  const MusclesModelCompanion({
    this.id = const Value.absent(),
    this.i18nName = const Value.absent(),
  });
  MusclesModelCompanion.insert({
    this.id = const Value.absent(),
    @required int i18nName,
  }) : i18nName = Value(i18nName);
  static Insertable<MuscleModel> custom({
    Expression<int> id,
    Expression<int> i18nName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (i18nName != null) 'i18n_name': i18nName,
    });
  }

  MusclesModelCompanion copyWith({Value<int> id, Value<int> i18nName}) {
    return MusclesModelCompanion(
      id: id ?? this.id,
      i18nName: i18nName ?? this.i18nName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (i18nName.present) {
      map['i18n_name'] = Variable<int>(i18nName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MusclesModelCompanion(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }
}

class $MusclesModelTable extends MusclesModel
    with TableInfo<$MusclesModelTable, MuscleModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $MusclesModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _i18nNameMeta = const VerificationMeta('i18nName');
  GeneratedIntColumn _i18nName;
  @override
  GeneratedIntColumn get i18nName => _i18nName ??= _constructI18nName();
  GeneratedIntColumn _constructI18nName() {
    return GeneratedIntColumn('i18n_name', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, i18nName];
  @override
  $MusclesModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'muscles';
  @override
  final String actualTableName = 'muscles';
  @override
  VerificationContext validateIntegrity(Insertable<MuscleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('i18n_name')) {
      context.handle(_i18nNameMeta,
          i18nName.isAcceptableOrUnknown(data['i18n_name'], _i18nNameMeta));
    } else if (isInserting) {
      context.missing(_i18nNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MuscleModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MuscleModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MusclesModelTable createAlias(String alias) {
    return $MusclesModelTable(_db, alias);
  }
}

class SessionModel extends DataClass implements Insertable<SessionModel> {
  final int id;
  final DateTime startedAt;
  final DateTime finishedAt;
  SessionModel(
      {@required this.id, @required this.startedAt, @required this.finishedAt});
  factory SessionModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return SessionModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      startedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}started_at']),
      finishedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}finished_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    return map;
  }

  SessionsModelCompanion toCompanion(bool nullToAbsent) {
    return SessionsModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
    );
  }

  factory SessionModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SessionModel(
      id: serializer.fromJson<int>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime>(json['finishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime>(finishedAt),
    };
  }

  SessionModel copyWith({int id, DateTime startedAt, DateTime finishedAt}) =>
      SessionModel(
        id: id ?? this.id,
        startedAt: startedAt ?? this.startedAt,
        finishedAt: finishedAt ?? this.finishedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SessionModel(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(startedAt.hashCode, finishedAt.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SessionModel &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt);
}

class SessionsModelCompanion extends UpdateCompanion<SessionModel> {
  final Value<int> id;
  final Value<DateTime> startedAt;
  final Value<DateTime> finishedAt;
  const SessionsModelCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
  });
  SessionsModelCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime startedAt,
    @required DateTime finishedAt,
  })  : startedAt = Value(startedAt),
        finishedAt = Value(finishedAt);
  static Insertable<SessionModel> custom({
    Expression<int> id,
    Expression<DateTime> startedAt,
    Expression<DateTime> finishedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
    });
  }

  SessionsModelCompanion copyWith(
      {Value<int> id, Value<DateTime> startedAt, Value<DateTime> finishedAt}) {
    return SessionsModelCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsModelCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }
}

class $SessionsModelTable extends SessionsModel
    with TableInfo<$SessionsModelTable, SessionModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $SessionsModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _startedAtMeta = const VerificationMeta('startedAt');
  GeneratedDateTimeColumn _startedAt;
  @override
  GeneratedDateTimeColumn get startedAt => _startedAt ??= _constructStartedAt();
  GeneratedDateTimeColumn _constructStartedAt() {
    return GeneratedDateTimeColumn(
      'started_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _finishedAtMeta = const VerificationMeta('finishedAt');
  GeneratedDateTimeColumn _finishedAt;
  @override
  GeneratedDateTimeColumn get finishedAt =>
      _finishedAt ??= _constructFinishedAt();
  GeneratedDateTimeColumn _constructFinishedAt() {
    return GeneratedDateTimeColumn(
      'finished_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, startedAt, finishedAt];
  @override
  $SessionsModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sessions';
  @override
  final String actualTableName = 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<SessionModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at'], _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
          _finishedAtMeta,
          finishedAt.isAcceptableOrUnknown(
              data['finished_at'], _finishedAtMeta));
    } else if (isInserting) {
      context.missing(_finishedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SessionModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SessionsModelTable createAlias(String alias) {
    return $SessionsModelTable(_db, alias);
  }
}

class SessionItemModel extends DataClass
    implements Insertable<SessionItemModel> {
  final int id;
  final int sessionId;
  final int exerciseId;
  final int unitSystemId;
  final int order;
  final int repetitions;
  final int groupNumber;
  final double weight;
  final double duration;
  SessionItemModel(
      {@required this.id,
      @required this.sessionId,
      @required this.exerciseId,
      @required this.unitSystemId,
      @required this.order,
      @required this.repetitions,
      this.groupNumber,
      @required this.weight,
      this.duration});
  factory SessionItemModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SessionItemModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      sessionId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}session_id']),
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
      unitSystemId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_system_id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
      repetitions: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}repetitions']),
      groupNumber: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}group_number']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      duration: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}duration']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int>(sessionId);
    }
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || unitSystemId != null) {
      map['unit_system_id'] = Variable<int>(unitSystemId);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || repetitions != null) {
      map['repetitions'] = Variable<int>(repetitions);
    }
    if (!nullToAbsent || groupNumber != null) {
      map['group_number'] = Variable<int>(groupNumber);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<double>(duration);
    }
    return map;
  }

  SessionItemsModelCompanion toCompanion(bool nullToAbsent) {
    return SessionItemsModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      unitSystemId: unitSystemId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitSystemId),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      repetitions: repetitions == null && nullToAbsent
          ? const Value.absent()
          : Value(repetitions),
      groupNumber: groupNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(groupNumber),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
    );
  }

  factory SessionItemModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SessionItemModel(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      unitSystemId: serializer.fromJson<int>(json['unitSystemId']),
      order: serializer.fromJson<int>(json['order']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      groupNumber: serializer.fromJson<int>(json['groupNumber']),
      weight: serializer.fromJson<double>(json['weight']),
      duration: serializer.fromJson<double>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'unitSystemId': serializer.toJson<int>(unitSystemId),
      'order': serializer.toJson<int>(order),
      'repetitions': serializer.toJson<int>(repetitions),
      'groupNumber': serializer.toJson<int>(groupNumber),
      'weight': serializer.toJson<double>(weight),
      'duration': serializer.toJson<double>(duration),
    };
  }

  SessionItemModel copyWith(
          {int id,
          int sessionId,
          int exerciseId,
          int unitSystemId,
          int order,
          int repetitions,
          int groupNumber,
          double weight,
          double duration}) =>
      SessionItemModel(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        exerciseId: exerciseId ?? this.exerciseId,
        unitSystemId: unitSystemId ?? this.unitSystemId,
        order: order ?? this.order,
        repetitions: repetitions ?? this.repetitions,
        groupNumber: groupNumber ?? this.groupNumber,
        weight: weight ?? this.weight,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('SessionItemModel(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('unitSystemId: $unitSystemId, ')
          ..write('order: $order, ')
          ..write('repetitions: $repetitions, ')
          ..write('groupNumber: $groupNumber, ')
          ..write('weight: $weight, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          sessionId.hashCode,
          $mrjc(
              exerciseId.hashCode,
              $mrjc(
                  unitSystemId.hashCode,
                  $mrjc(
                      order.hashCode,
                      $mrjc(
                          repetitions.hashCode,
                          $mrjc(groupNumber.hashCode,
                              $mrjc(weight.hashCode, duration.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SessionItemModel &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.unitSystemId == this.unitSystemId &&
          other.order == this.order &&
          other.repetitions == this.repetitions &&
          other.groupNumber == this.groupNumber &&
          other.weight == this.weight &&
          other.duration == this.duration);
}

class SessionItemsModelCompanion extends UpdateCompanion<SessionItemModel> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<int> exerciseId;
  final Value<int> unitSystemId;
  final Value<int> order;
  final Value<int> repetitions;
  final Value<int> groupNumber;
  final Value<double> weight;
  final Value<double> duration;
  const SessionItemsModelCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.unitSystemId = const Value.absent(),
    this.order = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.groupNumber = const Value.absent(),
    this.weight = const Value.absent(),
    this.duration = const Value.absent(),
  });
  SessionItemsModelCompanion.insert({
    this.id = const Value.absent(),
    @required int sessionId,
    @required int exerciseId,
    @required int unitSystemId,
    @required int order,
    @required int repetitions,
    this.groupNumber = const Value.absent(),
    @required double weight,
    this.duration = const Value.absent(),
  })  : sessionId = Value(sessionId),
        exerciseId = Value(exerciseId),
        unitSystemId = Value(unitSystemId),
        order = Value(order),
        repetitions = Value(repetitions),
        weight = Value(weight);
  static Insertable<SessionItemModel> custom({
    Expression<int> id,
    Expression<int> sessionId,
    Expression<int> exerciseId,
    Expression<int> unitSystemId,
    Expression<int> order,
    Expression<int> repetitions,
    Expression<int> groupNumber,
    Expression<double> weight,
    Expression<double> duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (unitSystemId != null) 'unit_system_id': unitSystemId,
      if (order != null) 'order': order,
      if (repetitions != null) 'repetitions': repetitions,
      if (groupNumber != null) 'group_number': groupNumber,
      if (weight != null) 'weight': weight,
      if (duration != null) 'duration': duration,
    });
  }

  SessionItemsModelCompanion copyWith(
      {Value<int> id,
      Value<int> sessionId,
      Value<int> exerciseId,
      Value<int> unitSystemId,
      Value<int> order,
      Value<int> repetitions,
      Value<int> groupNumber,
      Value<double> weight,
      Value<double> duration}) {
    return SessionItemsModelCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      unitSystemId: unitSystemId ?? this.unitSystemId,
      order: order ?? this.order,
      repetitions: repetitions ?? this.repetitions,
      groupNumber: groupNumber ?? this.groupNumber,
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (unitSystemId.present) {
      map['unit_system_id'] = Variable<int>(unitSystemId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (groupNumber.present) {
      map['group_number'] = Variable<int>(groupNumber.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionItemsModelCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('unitSystemId: $unitSystemId, ')
          ..write('order: $order, ')
          ..write('repetitions: $repetitions, ')
          ..write('groupNumber: $groupNumber, ')
          ..write('weight: $weight, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $SessionItemsModelTable extends SessionItemsModel
    with TableInfo<$SessionItemsModelTable, SessionItemModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $SessionItemsModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  GeneratedIntColumn _sessionId;
  @override
  GeneratedIntColumn get sessionId => _sessionId ??= _constructSessionId();
  GeneratedIntColumn _constructSessionId() {
    return GeneratedIntColumn('session_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES sessions(id)');
  }

  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  GeneratedIntColumn _exerciseId;
  @override
  GeneratedIntColumn get exerciseId => _exerciseId ??= _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES exercises(id)');
  }

  final VerificationMeta _unitSystemIdMeta =
      const VerificationMeta('unitSystemId');
  GeneratedIntColumn _unitSystemId;
  @override
  GeneratedIntColumn get unitSystemId =>
      _unitSystemId ??= _constructUnitSystemId();
  GeneratedIntColumn _constructUnitSystemId() {
    return GeneratedIntColumn('unit_system_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES unit_systems(id)');
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn(
      'order',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  GeneratedIntColumn _repetitions;
  @override
  GeneratedIntColumn get repetitions =>
      _repetitions ??= _constructRepetitions();
  GeneratedIntColumn _constructRepetitions() {
    return GeneratedIntColumn(
      'repetitions',
      $tableName,
      false,
    );
  }

  final VerificationMeta _groupNumberMeta =
      const VerificationMeta('groupNumber');
  GeneratedIntColumn _groupNumber;
  @override
  GeneratedIntColumn get groupNumber =>
      _groupNumber ??= _constructGroupNumber();
  GeneratedIntColumn _constructGroupNumber() {
    return GeneratedIntColumn(
      'group_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  GeneratedRealColumn _duration;
  @override
  GeneratedRealColumn get duration => _duration ??= _constructDuration();
  GeneratedRealColumn _constructDuration() {
    return GeneratedRealColumn(
      'duration',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        exerciseId,
        unitSystemId,
        order,
        repetitions,
        groupNumber,
        weight,
        duration
      ];
  @override
  $SessionItemsModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'session_items';
  @override
  final String actualTableName = 'session_items';
  @override
  VerificationContext validateIntegrity(Insertable<SessionItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id'], _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('unit_system_id')) {
      context.handle(
          _unitSystemIdMeta,
          unitSystemId.isAcceptableOrUnknown(
              data['unit_system_id'], _unitSystemIdMeta));
    } else if (isInserting) {
      context.missing(_unitSystemIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions'], _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('group_number')) {
      context.handle(
          _groupNumberMeta,
          groupNumber.isAcceptableOrUnknown(
              data['group_number'], _groupNumberMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration'], _durationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionItemModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SessionItemModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SessionItemsModelTable createAlias(String alias) {
    return $SessionItemsModelTable(_db, alias);
  }
}

class UnitSystemModel extends DataClass implements Insertable<UnitSystemModel> {
  final int id;
  final int i18nName;
  UnitSystemModel({@required this.id, @required this.i18nName});
  factory UnitSystemModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return UnitSystemModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      i18nName:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}i18n_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || i18nName != null) {
      map['i18n_name'] = Variable<int>(i18nName);
    }
    return map;
  }

  UnitSystemsModelCompanion toCompanion(bool nullToAbsent) {
    return UnitSystemsModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      i18nName: i18nName == null && nullToAbsent
          ? const Value.absent()
          : Value(i18nName),
    );
  }

  factory UnitSystemModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UnitSystemModel(
      id: serializer.fromJson<int>(json['id']),
      i18nName: serializer.fromJson<int>(json['i18nName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'i18nName': serializer.toJson<int>(i18nName),
    };
  }

  UnitSystemModel copyWith({int id, int i18nName}) => UnitSystemModel(
        id: id ?? this.id,
        i18nName: i18nName ?? this.i18nName,
      );
  @override
  String toString() {
    return (StringBuffer('UnitSystemModel(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, i18nName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UnitSystemModel &&
          other.id == this.id &&
          other.i18nName == this.i18nName);
}

class UnitSystemsModelCompanion extends UpdateCompanion<UnitSystemModel> {
  final Value<int> id;
  final Value<int> i18nName;
  const UnitSystemsModelCompanion({
    this.id = const Value.absent(),
    this.i18nName = const Value.absent(),
  });
  UnitSystemsModelCompanion.insert({
    this.id = const Value.absent(),
    @required int i18nName,
  }) : i18nName = Value(i18nName);
  static Insertable<UnitSystemModel> custom({
    Expression<int> id,
    Expression<int> i18nName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (i18nName != null) 'i18n_name': i18nName,
    });
  }

  UnitSystemsModelCompanion copyWith({Value<int> id, Value<int> i18nName}) {
    return UnitSystemsModelCompanion(
      id: id ?? this.id,
      i18nName: i18nName ?? this.i18nName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (i18nName.present) {
      map['i18n_name'] = Variable<int>(i18nName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitSystemsModelCompanion(')
          ..write('id: $id, ')
          ..write('i18nName: $i18nName')
          ..write(')'))
        .toString();
  }
}

class $UnitSystemsModelTable extends UnitSystemsModel
    with TableInfo<$UnitSystemsModelTable, UnitSystemModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $UnitSystemsModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _i18nNameMeta = const VerificationMeta('i18nName');
  GeneratedIntColumn _i18nName;
  @override
  GeneratedIntColumn get i18nName => _i18nName ??= _constructI18nName();
  GeneratedIntColumn _constructI18nName() {
    return GeneratedIntColumn('i18n_name', $tableName, false,
        $customConstraints: 'NULL REFERENCES i18n(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, i18nName];
  @override
  $UnitSystemsModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'unit_systems';
  @override
  final String actualTableName = 'unit_systems';
  @override
  VerificationContext validateIntegrity(Insertable<UnitSystemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('i18n_name')) {
      context.handle(_i18nNameMeta,
          i18nName.isAcceptableOrUnknown(data['i18n_name'], _i18nNameMeta));
    } else if (isInserting) {
      context.missing(_i18nNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitSystemModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UnitSystemModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UnitSystemsModelTable createAlias(String alias) {
    return $UnitSystemsModelTable(_db, alias);
  }
}

class RoutineModel extends DataClass implements Insertable<RoutineModel> {
  final int id;
  final String name;
  final bool current;
  RoutineModel(
      {@required this.id, @required this.name, @required this.current});
  factory RoutineModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return RoutineModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      current:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}current']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || current != null) {
      map['current'] = Variable<bool>(current);
    }
    return map;
  }

  RoutinesModelCompanion toCompanion(bool nullToAbsent) {
    return RoutinesModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      current: current == null && nullToAbsent
          ? const Value.absent()
          : Value(current),
    );
  }

  factory RoutineModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      current: serializer.fromJson<bool>(json['current']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'current': serializer.toJson<bool>(current),
    };
  }

  RoutineModel copyWith({int id, String name, bool current}) => RoutineModel(
        id: id ?? this.id,
        name: name ?? this.name,
        current: current ?? this.current,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('current: $current')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, current.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.current == this.current);
}

class RoutinesModelCompanion extends UpdateCompanion<RoutineModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> current;
  const RoutinesModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.current = const Value.absent(),
  });
  RoutinesModelCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.current = const Value.absent(),
  }) : name = Value(name);
  static Insertable<RoutineModel> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<bool> current,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (current != null) 'current': current,
    });
  }

  RoutinesModelCompanion copyWith(
      {Value<int> id, Value<String> name, Value<bool> current}) {
    return RoutinesModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      current: current ?? this.current,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (current.present) {
      map['current'] = Variable<bool>(current.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('current: $current')
          ..write(')'))
        .toString();
  }
}

class $RoutinesModelTable extends RoutinesModel
    with TableInfo<$RoutinesModelTable, RoutineModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $RoutinesModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currentMeta = const VerificationMeta('current');
  GeneratedBoolColumn _current;
  @override
  GeneratedBoolColumn get current => _current ??= _constructCurrent();
  GeneratedBoolColumn _constructCurrent() {
    return GeneratedBoolColumn('current', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, current];
  @override
  $RoutinesModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routines';
  @override
  final String actualTableName = 'routines';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('current')) {
      context.handle(_currentMeta,
          current.isAcceptableOrUnknown(data['current'], _currentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutinesModelTable createAlias(String alias) {
    return $RoutinesModelTable(_db, alias);
  }
}

class RoutineDayModel extends DataClass implements Insertable<RoutineDayModel> {
  final int id;
  final int routineId;
  final String name;
  final int order;
  RoutineDayModel(
      {@required this.id,
      @required this.routineId,
      @required this.name,
      @required this.order});
  factory RoutineDayModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RoutineDayModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      routineId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}routine_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || routineId != null) {
      map['routine_id'] = Variable<int>(routineId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    return map;
  }

  RoutineDaysModelCompanion toCompanion(bool nullToAbsent) {
    return RoutineDaysModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      routineId: routineId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
    );
  }

  factory RoutineDayModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineDayModel(
      id: serializer.fromJson<int>(json['id']),
      routineId: serializer.fromJson<int>(json['routineId']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routineId': serializer.toJson<int>(routineId),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
    };
  }

  RoutineDayModel copyWith({int id, int routineId, String name, int order}) =>
      RoutineDayModel(
        id: id ?? this.id,
        routineId: routineId ?? this.routineId,
        name: name ?? this.name,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineDayModel(')
          ..write('id: $id, ')
          ..write('routineId: $routineId, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(routineId.hashCode, $mrjc(name.hashCode, order.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineDayModel &&
          other.id == this.id &&
          other.routineId == this.routineId &&
          other.name == this.name &&
          other.order == this.order);
}

class RoutineDaysModelCompanion extends UpdateCompanion<RoutineDayModel> {
  final Value<int> id;
  final Value<int> routineId;
  final Value<String> name;
  final Value<int> order;
  const RoutineDaysModelCompanion({
    this.id = const Value.absent(),
    this.routineId = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
  });
  RoutineDaysModelCompanion.insert({
    this.id = const Value.absent(),
    @required int routineId,
    @required String name,
    @required int order,
  })  : routineId = Value(routineId),
        name = Value(name),
        order = Value(order);
  static Insertable<RoutineDayModel> custom({
    Expression<int> id,
    Expression<int> routineId,
    Expression<String> name,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineId != null) 'routine_id': routineId,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
    });
  }

  RoutineDaysModelCompanion copyWith(
      {Value<int> id,
      Value<int> routineId,
      Value<String> name,
      Value<int> order}) {
    return RoutineDaysModelCompanion(
      id: id ?? this.id,
      routineId: routineId ?? this.routineId,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<int>(routineId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineDaysModelCompanion(')
          ..write('id: $id, ')
          ..write('routineId: $routineId, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $RoutineDaysModelTable extends RoutineDaysModel
    with TableInfo<$RoutineDaysModelTable, RoutineDayModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $RoutineDaysModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _routineIdMeta = const VerificationMeta('routineId');
  GeneratedIntColumn _routineId;
  @override
  GeneratedIntColumn get routineId => _routineId ??= _constructRoutineId();
  GeneratedIntColumn _constructRoutineId() {
    return GeneratedIntColumn('routine_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES routines(id)');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn(
      'order',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, routineId, name, order];
  @override
  $RoutineDaysModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routine_days';
  @override
  final String actualTableName = 'routine_days';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineDayModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('routine_id')) {
      context.handle(_routineIdMeta,
          routineId.isAcceptableOrUnknown(data['routine_id'], _routineIdMeta));
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineDayModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineDayModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutineDaysModelTable createAlias(String alias) {
    return $RoutineDaysModelTable(_db, alias);
  }
}

class RoutineItemModel extends DataClass
    implements Insertable<RoutineItemModel> {
  final int id;
  final int routineDayId;
  final int exerciseId;
  final String note;
  final int restDuration;
  final int order;
  final int groupNumber;
  RoutineItemModel(
      {@required this.id,
      @required this.routineDayId,
      @required this.exerciseId,
      @required this.note,
      @required this.restDuration,
      @required this.order,
      this.groupNumber});
  factory RoutineItemModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RoutineItemModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      routineDayId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}routine_day_id']),
      exerciseId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      restDuration: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}rest_duration']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
      groupNumber: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}group_number']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || routineDayId != null) {
      map['routine_day_id'] = Variable<int>(routineDayId);
    }
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || restDuration != null) {
      map['rest_duration'] = Variable<int>(restDuration);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || groupNumber != null) {
      map['group_number'] = Variable<int>(groupNumber);
    }
    return map;
  }

  RoutineItemsModelCompanion toCompanion(bool nullToAbsent) {
    return RoutineItemsModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      routineDayId: routineDayId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineDayId),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      restDuration: restDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(restDuration),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      groupNumber: groupNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(groupNumber),
    );
  }

  factory RoutineItemModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoutineItemModel(
      id: serializer.fromJson<int>(json['id']),
      routineDayId: serializer.fromJson<int>(json['routineDayId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      note: serializer.fromJson<String>(json['note']),
      restDuration: serializer.fromJson<int>(json['restDuration']),
      order: serializer.fromJson<int>(json['order']),
      groupNumber: serializer.fromJson<int>(json['groupNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routineDayId': serializer.toJson<int>(routineDayId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'note': serializer.toJson<String>(note),
      'restDuration': serializer.toJson<int>(restDuration),
      'order': serializer.toJson<int>(order),
      'groupNumber': serializer.toJson<int>(groupNumber),
    };
  }

  RoutineItemModel copyWith(
          {int id,
          int routineDayId,
          int exerciseId,
          String note,
          int restDuration,
          int order,
          int groupNumber}) =>
      RoutineItemModel(
        id: id ?? this.id,
        routineDayId: routineDayId ?? this.routineDayId,
        exerciseId: exerciseId ?? this.exerciseId,
        note: note ?? this.note,
        restDuration: restDuration ?? this.restDuration,
        order: order ?? this.order,
        groupNumber: groupNumber ?? this.groupNumber,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineItemModel(')
          ..write('id: $id, ')
          ..write('routineDayId: $routineDayId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('note: $note, ')
          ..write('restDuration: $restDuration, ')
          ..write('order: $order, ')
          ..write('groupNumber: $groupNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          routineDayId.hashCode,
          $mrjc(
              exerciseId.hashCode,
              $mrjc(
                  note.hashCode,
                  $mrjc(restDuration.hashCode,
                      $mrjc(order.hashCode, groupNumber.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RoutineItemModel &&
          other.id == this.id &&
          other.routineDayId == this.routineDayId &&
          other.exerciseId == this.exerciseId &&
          other.note == this.note &&
          other.restDuration == this.restDuration &&
          other.order == this.order &&
          other.groupNumber == this.groupNumber);
}

class RoutineItemsModelCompanion extends UpdateCompanion<RoutineItemModel> {
  final Value<int> id;
  final Value<int> routineDayId;
  final Value<int> exerciseId;
  final Value<String> note;
  final Value<int> restDuration;
  final Value<int> order;
  final Value<int> groupNumber;
  const RoutineItemsModelCompanion({
    this.id = const Value.absent(),
    this.routineDayId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.note = const Value.absent(),
    this.restDuration = const Value.absent(),
    this.order = const Value.absent(),
    this.groupNumber = const Value.absent(),
  });
  RoutineItemsModelCompanion.insert({
    this.id = const Value.absent(),
    @required int routineDayId,
    @required int exerciseId,
    @required String note,
    @required int restDuration,
    @required int order,
    this.groupNumber = const Value.absent(),
  })  : routineDayId = Value(routineDayId),
        exerciseId = Value(exerciseId),
        note = Value(note),
        restDuration = Value(restDuration),
        order = Value(order);
  static Insertable<RoutineItemModel> custom({
    Expression<int> id,
    Expression<int> routineDayId,
    Expression<int> exerciseId,
    Expression<String> note,
    Expression<int> restDuration,
    Expression<int> order,
    Expression<int> groupNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineDayId != null) 'routine_day_id': routineDayId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (note != null) 'note': note,
      if (restDuration != null) 'rest_duration': restDuration,
      if (order != null) 'order': order,
      if (groupNumber != null) 'group_number': groupNumber,
    });
  }

  RoutineItemsModelCompanion copyWith(
      {Value<int> id,
      Value<int> routineDayId,
      Value<int> exerciseId,
      Value<String> note,
      Value<int> restDuration,
      Value<int> order,
      Value<int> groupNumber}) {
    return RoutineItemsModelCompanion(
      id: id ?? this.id,
      routineDayId: routineDayId ?? this.routineDayId,
      exerciseId: exerciseId ?? this.exerciseId,
      note: note ?? this.note,
      restDuration: restDuration ?? this.restDuration,
      order: order ?? this.order,
      groupNumber: groupNumber ?? this.groupNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routineDayId.present) {
      map['routine_day_id'] = Variable<int>(routineDayId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (restDuration.present) {
      map['rest_duration'] = Variable<int>(restDuration.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (groupNumber.present) {
      map['group_number'] = Variable<int>(groupNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineItemsModelCompanion(')
          ..write('id: $id, ')
          ..write('routineDayId: $routineDayId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('note: $note, ')
          ..write('restDuration: $restDuration, ')
          ..write('order: $order, ')
          ..write('groupNumber: $groupNumber')
          ..write(')'))
        .toString();
  }
}

class $RoutineItemsModelTable extends RoutineItemsModel
    with TableInfo<$RoutineItemsModelTable, RoutineItemModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $RoutineItemsModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _routineDayIdMeta =
      const VerificationMeta('routineDayId');
  GeneratedIntColumn _routineDayId;
  @override
  GeneratedIntColumn get routineDayId =>
      _routineDayId ??= _constructRoutineDayId();
  GeneratedIntColumn _constructRoutineDayId() {
    return GeneratedIntColumn('routine_day_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES routine_days(id)');
  }

  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  GeneratedIntColumn _exerciseId;
  @override
  GeneratedIntColumn get exerciseId => _exerciseId ??= _constructExerciseId();
  GeneratedIntColumn _constructExerciseId() {
    return GeneratedIntColumn('exercise_id', $tableName, false,
        $customConstraints: 'NULL REFERENCES exercises(id)');
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      false,
    );
  }

  final VerificationMeta _restDurationMeta =
      const VerificationMeta('restDuration');
  GeneratedIntColumn _restDuration;
  @override
  GeneratedIntColumn get restDuration =>
      _restDuration ??= _constructRestDuration();
  GeneratedIntColumn _constructRestDuration() {
    return GeneratedIntColumn(
      'rest_duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  @override
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn(
      'order',
      $tableName,
      false,
    );
  }

  final VerificationMeta _groupNumberMeta =
      const VerificationMeta('groupNumber');
  GeneratedIntColumn _groupNumber;
  @override
  GeneratedIntColumn get groupNumber =>
      _groupNumber ??= _constructGroupNumber();
  GeneratedIntColumn _constructGroupNumber() {
    return GeneratedIntColumn(
      'group_number',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, routineDayId, exerciseId, note, restDuration, order, groupNumber];
  @override
  $RoutineItemsModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'routine_items';
  @override
  final String actualTableName = 'routine_items';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('routine_day_id')) {
      context.handle(
          _routineDayIdMeta,
          routineDayId.isAcceptableOrUnknown(
              data['routine_day_id'], _routineDayIdMeta));
    } else if (isInserting) {
      context.missing(_routineDayIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id'], _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('rest_duration')) {
      context.handle(
          _restDurationMeta,
          restDuration.isAcceptableOrUnknown(
              data['rest_duration'], _restDurationMeta));
    } else if (isInserting) {
      context.missing(_restDurationMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('group_number')) {
      context.handle(
          _groupNumberMeta,
          groupNumber.isAcceptableOrUnknown(
              data['group_number'], _groupNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineItemModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RoutineItemModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RoutineItemsModelTable createAlias(String alias) {
    return $RoutineItemsModelTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $I18nTable _i18n;
  $I18nTable get i18n => _i18n ??= $I18nTable(this);
  $TranslationsTable _translations;
  $TranslationsTable get translations =>
      _translations ??= $TranslationsTable(this);
  $LocalesTable _locales;
  $LocalesTable get locales => _locales ??= $LocalesTable(this);
  $ExercisesModelTable _exercisesModel;
  $ExercisesModelTable get exercisesModel =>
      _exercisesModel ??= $ExercisesModelTable(this);
  $ExercisesTypesModelTable _exercisesTypesModel;
  $ExercisesTypesModelTable get exercisesTypesModel =>
      _exercisesTypesModel ??= $ExercisesTypesModelTable(this);
  $EquipmentsModelTable _equipmentsModel;
  $EquipmentsModelTable get equipmentsModel =>
      _equipmentsModel ??= $EquipmentsModelTable(this);
  $ExercisesMusclesModelTable _exercisesMusclesModel;
  $ExercisesMusclesModelTable get exercisesMusclesModel =>
      _exercisesMusclesModel ??= $ExercisesMusclesModelTable(this);
  $MusclesModelTable _musclesModel;
  $MusclesModelTable get musclesModel =>
      _musclesModel ??= $MusclesModelTable(this);
  $SessionsModelTable _sessionsModel;
  $SessionsModelTable get sessionsModel =>
      _sessionsModel ??= $SessionsModelTable(this);
  $SessionItemsModelTable _sessionItemsModel;
  $SessionItemsModelTable get sessionItemsModel =>
      _sessionItemsModel ??= $SessionItemsModelTable(this);
  $UnitSystemsModelTable _unitSystemsModel;
  $UnitSystemsModelTable get unitSystemsModel =>
      _unitSystemsModel ??= $UnitSystemsModelTable(this);
  $RoutinesModelTable _routinesModel;
  $RoutinesModelTable get routinesModel =>
      _routinesModel ??= $RoutinesModelTable(this);
  $RoutineDaysModelTable _routineDaysModel;
  $RoutineDaysModelTable get routineDaysModel =>
      _routineDaysModel ??= $RoutineDaysModelTable(this);
  $RoutineItemsModelTable _routineItemsModel;
  $RoutineItemsModelTable get routineItemsModel =>
      _routineItemsModel ??= $RoutineItemsModelTable(this);
  ExercisesDao _exercisesDao;
  ExercisesDao get exercisesDao =>
      _exercisesDao ??= ExercisesDao(this as MyDatabase);
  RoutinesDao _routinesDao;
  RoutinesDao get routinesDao =>
      _routinesDao ??= RoutinesDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        i18n,
        translations,
        locales,
        exercisesModel,
        exercisesTypesModel,
        equipmentsModel,
        exercisesMusclesModel,
        musclesModel,
        sessionsModel,
        sessionItemsModel,
        unitSystemsModel,
        routinesModel,
        routineDaysModel,
        routineItemsModel
      ];
}

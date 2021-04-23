import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

part 'set.g.dart';

@JsonSerializable()
class RoutineSet extends Equatable {
  final int id;
  final int minReps;
  final int maxReps;
  final bool allOut;
  final int restSeconds;

  RoutineSet({
    int? id,
    required this.minReps,
    required this.maxReps,
    required this.allOut,
    required this.restSeconds,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  RoutineSet.empty()
      : minReps = 0,
        maxReps = 0,
        allOut = false,
        restSeconds = 0,
        id = DateTime.now().millisecondsSinceEpoch;

  RoutineSet copyWith({
    int? id,
    int? minReps,
    int? maxReps,
    bool? allOut,
    int? restSeconds,
  }) {
    return RoutineSet(
      id: id,
      minReps: minReps ?? this.minReps,
      maxReps: maxReps ?? this.maxReps,
      allOut: allOut ?? this.allOut,
      restSeconds: restSeconds ?? this.restSeconds,
    );
  }

  factory RoutineSet.fromJson(Map<String, dynamic> json) =>
      _$RoutineSetFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineSetToJson(this);

  @override
  List<Object> get props => [id];
}

class SetConverter extends TypeConverter<List<RoutineSet>, String> {
  const SetConverter();

  @override
  List<RoutineSet>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }

    final sets = jsonDecode(fromDb) as List<Map<String, dynamic>>;
    return sets.map((setJson) => RoutineSet.fromJson(setJson)).toList();
  }

  @override
  String? mapToSql(List<RoutineSet>? value) {
    if (value == null) {
      return null;
    }

    return jsonEncode(value);
  }
}

// @JsonSerializable()
// class RoutineSets {
//   factory RoutineSets.fromJson(Map<String, dynamic> json) =>
//       _$RoutineSetsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RoutineSetsToJson(this);
// }
//
// class RoutineSetsConverter extends TypeConverter<List<>>

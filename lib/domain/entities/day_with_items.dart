import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:workout_logger/db/db.dart';

class DayWithItems {
  final Either<RoutineDayModel, RoutineDaysModelCompanion> day;
  final BuiltList<Either<RoutineItemModel, RoutineItemsModelCompanion>> items;

  DayWithItems({required this.day, required this.items});

  DayWithItems.fromModel({
    required RoutineDayModel day,
    required List<RoutineItemModel> items,
  })   : day = Left(day),
        items = BuiltList(items);

  DayWithItems.empty()
      : day = const Right(RoutineDaysModelCompanion()),
        items = BuiltList();

  DayWithItems copyWith({
    Either<RoutineDayModel, RoutineDaysModelCompanion>? day,
    BuiltList<Either<RoutineItemModel, RoutineItemsModelCompanion>>? items,
  }) {
    return DayWithItems(
      day: day ?? this.day,
      items: items ?? this.items,
    );
  }
}

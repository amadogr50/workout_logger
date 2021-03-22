import 'package:moor/moor.dart';
import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/core/db/tables/exercises.dart';

part 'exercises_dao.g.dart';

@UseDao(
  tables: [ExercisesModel, ExercisesTypesModel, EquipmentsModel, ExercisesMusclesModel, MusclesModel],
)
class ExercisesDao extends DatabaseAccessor<MyDatabase>
    with _$ExercisesDaoMixin {
  ExercisesDao(MyDatabase db) : super(db);
}

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:workout_logger/domain/entities/equipment.dart';
import 'package:workout_logger/domain/entities/exercise_type.dart';
import 'package:workout_logger/domain/entities/muscles.dart';

class Exercise extends Equatable {
  final int id;
  final String name;
  final String instructions;
  final ExerciseType type;
  final List<Muscle> muscles;
  final Equipment equipment;

  const Exercise(
      {@required this.id,
      @required this.name,
      @required this.instructions,
      @required this.type,
      @required this.muscles,
      @required this.equipment});

  @override
  List<Object> get props => [name, instructions, type, muscles, equipment];
}

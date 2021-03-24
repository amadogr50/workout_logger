import 'package:equatable/equatable.dart';

class ExerciseType extends Equatable {
  final int id;
  final String name;

  const ExerciseType({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/exercise.dart';

class SessionItem extends Equatable {
  final int id;
  final Exercise exercise;
  final int order;
  final int repetitions;
  final double weight;
  final double duration;
  final int? groupNumber;

  const SessionItem({
    required this.id,
    required this.exercise,
    required this.order,
    required this.repetitions,
    required this.weight,
    required this.duration,
    this.groupNumber,
  });

  @override
  List<Object> get props => [id];
}

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:workout_logger/domain/entities/exercise.dart';

class SessionItem extends Equatable {
  final Exercise exercise;
  final int order;
  final int repetitions;
  final double weight;
  final double duration;
  final int groupNumber;

  const SessionItem(
      {@required this.exercise,
      @required this.order,
      @required this.repetitions,
      @required this.weight,
      @required this.duration,
      this.groupNumber});

  @override
  List<Object> get props =>
      [exercise, order, repetitions, weight, duration, groupNumber];
}

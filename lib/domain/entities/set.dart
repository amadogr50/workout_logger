import 'package:equatable/equatable.dart';

class Set extends Equatable {
  final int minReps;
  final int maxReps;

  const Set({
    required this.minReps,
    required this.maxReps,
  });

  @override
  List<Object> get props => [minReps, maxReps];
}

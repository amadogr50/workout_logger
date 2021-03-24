import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/session_item.dart';

class Session extends Equatable {
  final List<SessionItem> items;
  final DateTime startedAt;
  final DateTime finishedAt;

  const Session({
    required this.startedAt,
    required this.finishedAt,
    required this.items,
  });

  @override
  List<Object> get props => [startedAt, finishedAt];
}

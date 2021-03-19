import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final String name;

  const Routine(this.name);

  @override
  List<Object> get props => [name];
}
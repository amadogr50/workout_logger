import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String name;
  final String instructions;

  Exercise(this.name, this.instructions);

  @override
  List<Object> get props => throw UnimplementedError();
}
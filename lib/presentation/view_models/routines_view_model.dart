import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/providers/routines_repository_provider.dart';

final routinesProvider = StreamProvider.autoDispose<List<Routine>>(
    (ref) => ref.read(routinesRepositoryProvider).watchRoutines());

class RoutinesViewModel extends ChangeNotifier {}

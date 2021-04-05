import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/equipment.dart';
import 'package:workout_logger/domain/entities/muscles.dart';
import 'package:workout_logger/providers.dart';

final musclesProvider = FutureProvider.autoDispose<List<Muscle>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.exercisesDao.getMuscles();
});

final equipmentsProvider = FutureProvider.autoDispose<List<Equipment>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.exercisesDao.getEquipments();
});

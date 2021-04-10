import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/providers/local_data_source_provider.dart';
import 'package:workout_logger/domain/repositories/exercises_repository.dart';
import 'package:workout_logger/domain/repositories/exercises_repository_impl.dart';

final exercisesRepositoryProvider = Provider<ExercisesRepository>(
    (ref) => ExercisesRepositoryImpl(ref.read(localDataSourceProvider)));

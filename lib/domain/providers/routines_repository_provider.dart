import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';
import 'package:workout_logger/domain/repositories/routines_repository_impl.dart';

import 'local_data_source_provider.dart';

final routinesRepositoryProvider = Provider<RoutinesRepository>(
    (ref) => RoutinesRepositoryImpl(ref.read(localDataSourceProvider)));

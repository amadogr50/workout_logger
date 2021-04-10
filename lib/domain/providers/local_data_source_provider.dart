import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/datasources/database_data_source.dart';
import 'package:workout_logger/domain/datasources/local_data_source.dart';
import 'package:workout_logger/domain/providers/database_provider.dart';

final localDataSourceProvider = Provider<LocalDataSource>(
    (ref) => DatabaseDataSource(ref.read(databaseProvider)));

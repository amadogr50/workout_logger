import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/db/db.dart';

final databaseProvider = Provider<MyDatabase>((ref) => MyDatabase());

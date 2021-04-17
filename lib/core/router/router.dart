import 'package:auto_route/annotations.dart';
import 'package:workout_logger/presentation/pages/add_exercises_page.dart';
import 'package:workout_logger/presentation/pages/exercise__detail_page.dart';
import 'package:workout_logger/presentation/pages/home_page.dart';
import 'package:workout_logger/presentation/pages/routine_day_detail_page.dart';
import 'package:workout_logger/presentation/pages/routine_day_edition_page.dart';
import 'package:workout_logger/presentation/pages/routine_detail_page.dart';
import 'package:workout_logger/presentation/pages/routine_edition_page.dart';
import 'package:workout_logger/presentation/pages/routines_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: RoutinesPage),
  AutoRoute(page: RoutineDetailPage),
  AutoRoute(page: RoutineDayDetailPage),
  AutoRoute(page: ExerciseDetailPage),
  AutoRoute(page: RoutineDayEditionPage),
  AutoRoute(page: RoutineEditionPage),
  AutoRoute(page: AddExercisesPage),
])
class $AppRouter {}

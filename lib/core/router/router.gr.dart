// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i12;

import '../../domain/entities/exercise.dart' as _i13;
import '../../domain/entities/routine_day.dart' as _i11;
import '../../domain/entities/routine_item.dart' as _i14;
import '../../presentation/pages/add_exercises_page.dart' as _i9;
import '../../presentation/pages/exercise__detail_page.dart' as _i6;
import '../../presentation/pages/home_page.dart' as _i2;
import '../../presentation/pages/routine_day_detail_page.dart' as _i5;
import '../../presentation/pages/routine_day_edition_page.dart' as _i7;
import '../../presentation/pages/routine_detail_page.dart' as _i4;
import '../../presentation/pages/routine_edition_page.dart' as _i8;
import '../../presentation/pages/routine_item_edition_page.dart' as _i10;
import '../../presentation/pages/routines_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.HomePage());
    },
    RoutinesPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.RoutinesPage());
    },
    RoutineDetailPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.RoutineDetailPage());
    },
    RoutineDayDetailPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.RoutineDayDetailPage());
    },
    ExerciseDetailPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.ExerciseDetailPage());
    },
    RoutineDayEditionPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<RoutineDayEditionPageRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i7.RoutineDayEditionPage(
              routineDay: args.routineDay, onConfirm: args.onConfirm));
    },
    RoutineEditionPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i8.RoutineEditionPage());
    },
    AddExercisesPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<AddExercisesPageRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i9.AddExercisesPage(
              routineDay: args.routineDay, onConfirm: args.onConfirm));
    },
    RoutineItemEditionPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<RoutineItemEditionPageRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i10.RoutineItemEditionPage(
              routineItem: args.routineItem, onConfirm: args.onConfirm));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(RoutinesPageRoute.name, path: '/routines-page'),
        _i1.RouteConfig(RoutineDetailPageRoute.name,
            path: '/routine-detail-page'),
        _i1.RouteConfig(RoutineDayDetailPageRoute.name,
            path: '/routine-day-detail-page'),
        _i1.RouteConfig(ExerciseDetailPageRoute.name,
            path: '/exercise-detail-page'),
        _i1.RouteConfig(RoutineDayEditionPageRoute.name,
            path: '/routine-day-edition-page'),
        _i1.RouteConfig(RoutineEditionPageRoute.name,
            path: '/routine-edition-page'),
        _i1.RouteConfig(AddExercisesPageRoute.name,
            path: '/add-exercises-page'),
        _i1.RouteConfig(RoutineItemEditionPageRoute.name,
            path: '/routine-item-edition-page')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class RoutinesPageRoute extends _i1.PageRouteInfo {
  const RoutinesPageRoute() : super(name, path: '/routines-page');

  static const String name = 'RoutinesPageRoute';
}

class RoutineDetailPageRoute extends _i1.PageRouteInfo {
  const RoutineDetailPageRoute() : super(name, path: '/routine-detail-page');

  static const String name = 'RoutineDetailPageRoute';
}

class RoutineDayDetailPageRoute extends _i1.PageRouteInfo {
  const RoutineDayDetailPageRoute()
      : super(name, path: '/routine-day-detail-page');

  static const String name = 'RoutineDayDetailPageRoute';
}

class ExerciseDetailPageRoute extends _i1.PageRouteInfo {
  const ExerciseDetailPageRoute() : super(name, path: '/exercise-detail-page');

  static const String name = 'ExerciseDetailPageRoute';
}

class RoutineDayEditionPageRoute
    extends _i1.PageRouteInfo<RoutineDayEditionPageRouteArgs> {
  RoutineDayEditionPageRoute(
      {required _i11.RoutineDay routineDay,
      required void Function(_i11.RoutineDay) onConfirm})
      : super(name,
            path: '/routine-day-edition-page',
            args: RoutineDayEditionPageRouteArgs(
                routineDay: routineDay, onConfirm: onConfirm));

  static const String name = 'RoutineDayEditionPageRoute';
}

class RoutineDayEditionPageRouteArgs {
  const RoutineDayEditionPageRouteArgs(
      {required this.routineDay, required this.onConfirm});

  final _i11.RoutineDay routineDay;

  final void Function(_i11.RoutineDay) onConfirm;
}

class RoutineEditionPageRoute extends _i1.PageRouteInfo {
  const RoutineEditionPageRoute() : super(name, path: '/routine-edition-page');

  static const String name = 'RoutineEditionPageRoute';
}

class AddExercisesPageRoute
    extends _i1.PageRouteInfo<AddExercisesPageRouteArgs> {
  AddExercisesPageRoute(
      {required _i11.RoutineDay routineDay,
      required void Function(_i12.BuiltSet<_i13.Exercise>) onConfirm})
      : super(name,
            path: '/add-exercises-page',
            args: AddExercisesPageRouteArgs(
                routineDay: routineDay, onConfirm: onConfirm));

  static const String name = 'AddExercisesPageRoute';
}

class AddExercisesPageRouteArgs {
  const AddExercisesPageRouteArgs(
      {required this.routineDay, required this.onConfirm});

  final _i11.RoutineDay routineDay;

  final void Function(_i12.BuiltSet<_i13.Exercise>) onConfirm;
}

class RoutineItemEditionPageRoute
    extends _i1.PageRouteInfo<RoutineItemEditionPageRouteArgs> {
  RoutineItemEditionPageRoute(
      {required _i14.RoutineItem routineItem,
      required void Function(_i14.RoutineItem) onConfirm})
      : super(name,
            path: '/routine-item-edition-page',
            args: RoutineItemEditionPageRouteArgs(
                routineItem: routineItem, onConfirm: onConfirm));

  static const String name = 'RoutineItemEditionPageRoute';
}

class RoutineItemEditionPageRouteArgs {
  const RoutineItemEditionPageRouteArgs(
      {required this.routineItem, required this.onConfirm});

  final _i14.RoutineItem routineItem;

  final void Function(_i14.RoutineItem) onConfirm;
}

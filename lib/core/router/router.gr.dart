// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../../presentation/pages/exercise__detail_page.dart' as _i6;
import '../../presentation/pages/home_page.dart' as _i2;
import '../../presentation/pages/routine_day_detail_page.dart' as _i5;
import '../../presentation/pages/routine_day_edition_page.dart' as _i7;
import '../../presentation/pages/routine_detail_page.dart' as _i4;
import '../../presentation/pages/routine_edition_page.dart' as _i8;
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
    RoutineDayAddEditPageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i7.RoutineDayAddEditPage());
    },
    RoutineEditionPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i8.RoutineEditionPage());
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
        _i1.RouteConfig(RoutineDayAddEditPageRoute.name,
            path: '/routine-day-add-edit-page'),
        _i1.RouteConfig(RoutineEditionPageRoute.name,
            path: '/routine-edition-page')
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

class RoutineDayAddEditPageRoute extends _i1.PageRouteInfo {
  const RoutineDayAddEditPageRoute()
      : super(name, path: '/routine-day-add-edit-page');

  static const String name = 'RoutineDayAddEditPageRoute';
}

class RoutineEditionPageRoute extends _i1.PageRouteInfo {
  const RoutineEditionPageRoute() : super(name, path: '/routine-edition-page');

  static const String name = 'RoutineEditionPageRoute';
}

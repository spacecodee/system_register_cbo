// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/get_job_page.dart' as _i3;
import '../pages/home_page.dart' as _i1;
import '../pages/register_user_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    RegisterUserRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterUserPage(),
      );
    },
    GetJobRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.GetJobPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i4.RouteConfig(
          RegisterUserRoute.name,
          path: '/register-user',
        ),
        _i4.RouteConfig(
          GetJobRoute.name,
          path: '/get-job',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.RegisterUserPage]
class RegisterUserRoute extends _i4.PageRouteInfo<void> {
  const RegisterUserRoute()
      : super(
          RegisterUserRoute.name,
          path: '/register-user',
        );

  static const String name = 'RegisterUserRoute';
}

/// generated route for
/// [_i3.GetJobPage]
class GetJobRoute extends _i4.PageRouteInfo<void> {
  const GetJobRoute()
      : super(
          GetJobRoute.name,
          path: '/get-job',
        );

  static const String name = 'GetJobRoute';
}

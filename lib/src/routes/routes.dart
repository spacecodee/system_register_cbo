import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/pages/get_job_page.dart';
import 'package:system_register_cbo/src/pages/home_page.dart';
import 'package:system_register_cbo/src/pages/register_user_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/register-user',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterUserPage();
      },
    ),
    GoRoute(
      path: '/get-job',
      builder: (BuildContext context, GoRouterState state) {
        return const GetJobPage();
      },
    ),
  ],
);

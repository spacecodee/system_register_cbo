import 'package:auto_route/annotations.dart';
import 'package:system_register_cbo/src/pages/HomePage.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}

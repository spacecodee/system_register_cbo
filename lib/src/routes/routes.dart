import 'package:auto_route/annotations.dart';
import 'package:system_register_cbo/src/pages/get_job_page.dart';
import 'package:system_register_cbo/src/pages/home_page.dart';
import 'package:system_register_cbo/src/pages/register_user_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: "*", redirectTo: "/home"),
    AutoRoute(path: "/home", page: HomePage, initial: true),
    AutoRoute(path: "/register-user", page: RegisterUserPage),
    AutoRoute(path: "/get-job", page: GetJobPage),
  ],
)
class $AppRouter {}

import 'package:go_router/go_router.dart';
import 'package:una/appPurpose.dart';
import 'package:una/firstLogin.dart';
import 'package:una/mainPage.dart';
import 'package:una/memInfo.dart';
import 'package:una/userLogin.dart';

final router = GoRouter(
  routes: [
    // GoRoute(
    //   path: FirstLogin.routeURL,
    //   name: FirstLogin.routeName,
    //   builder: (context, state) => const FirstLogin(),
    // ),
    // GoRoute(
    //   path: UserLogin.routeURL,
    //   name: UserLogin.routeName,
    //   builder: (context, state) => const UserLogin(),
    // ),
    // GoRoute(
    //   path: AppPurpose.routeURL,
    //   name: AppPurpose.routeName,
    //   builder: (context, state) => const AppPurpose(),
    // ),
    GoRoute(
      path: MemInfo.routeURL,
      name: MemInfo.routeName,
      builder: (context, state) => const MemInfo(),
    ),
    GoRoute(
      path: MainPage.routeURL,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
    ),
  ],
);

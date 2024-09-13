import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/bank/presentation/pages/bank_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/menu_page.dart';
import 'routes.dart';

export 'package:go_router/go_router.dart';
class CustomRouter{
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      initialLocation: Routes.home,
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return HomePage(child: child);
            },
            routes: [
              GoRoute(
                path: Routes.home,
                pageBuilder: (context,state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const BankPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                  );
                },

              ),
              GoRoute(
                path: Routes.menu,
                pageBuilder: (context,state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const MenuPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                  );
                },

              )
            ]
        ),
      ],
      //TODO: change this later
      errorPageBuilder: (context,state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(child: Text(state.error.toString())),
          )
      )
  );
}
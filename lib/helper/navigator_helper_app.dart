import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutalk/feature/home/screen.dart';
import 'package:nutalk/feature/main/screen.dart';

class CustomNavigatorHelperApp {
  static late final GoRouter router;

  static final CustomNavigatorHelperApp _instance = CustomNavigatorHelperApp._internal();

  static CustomNavigatorHelperApp get instance => _instance;

  factory CustomNavigatorHelperApp() => _instance;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  static const homePath = '/home';
  static const chatRoomPath = '/chatroom';
  static const bookingPath = '/booking';
  static const settingPath = '/setting';
  static const kratooPath = '/kratoo';



  CustomNavigatorHelperApp._internal() {
    GoRouter.optionURLReflectsImperativeAPIs = true;

    List<RouteBase> routes = [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homePath,
                name: '1',
                pageBuilder: (context, state) => getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homePath,
                name: '2',
                pageBuilder: (context, state) => getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homePath,
                name: '3',
                pageBuilder: (context, state) => getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homePath,
                name: '4',
                pageBuilder: (context, state) => getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homePath,
                name: '5',
                pageBuilder: (context, state) => getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
        ],
        pageBuilder: (context, state, navigationShell) =>
            getPage(child: MainNavigatorBar(child: navigationShell), state: state),
      ),
    ];
    router = GoRouter(routes: routes, initialLocation: homePath);
  }

  Page getPage({required Widget child, required GoRouterState state}) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: child,
    );
  }
}

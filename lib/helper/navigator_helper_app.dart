import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutalk/feature/home/screen.dart';
import 'package:nutalk/feature/kratoo/screen.dart';
import 'package:nutalk/feature/main/screen.dart';

import '../feature/booking/screen.dart';
import '../feature/chat/screen.dart';
import '../feature/note/screen.dart';

class CustomNavigatorHelperApp {
  static late final GoRouter router;

  GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> chatroomNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> noteNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> bookingNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> kratooNavigatorKey = GlobalKey<NavigatorState>();

  static final CustomNavigatorHelperApp _instance =
      CustomNavigatorHelperApp._internal();

  static CustomNavigatorHelperApp get instance => _instance;
  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  factory CustomNavigatorHelperApp() => _instance;

  static const homePath = '/home';
  static const chatRoomPath = '/chatroom';
  static const bookingPath = '/booking';
  static const notePath = '/note';
  static const kratooPath = '/kratoo';

  CustomNavigatorHelperApp._internal() {
    GoRouter.optionURLReflectsImperativeAPIs = true;

    List<RouteBase> routes = [
      StatefulShellRoute.indexedStack(
        // parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: kratooNavigatorKey,
            routes: [
              GoRoute(
                path: kratooPath,
                name: 'kratooPath',
                pageBuilder: (context, state) =>
                    getPage(child: const KratooScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: chatroomNavigatorKey,
            routes: [
              GoRoute(
                path: chatRoomPath,
                name: 'chatroomPath',
                pageBuilder: (context, state) =>
                    getPage(child: const ChatRoomScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                name: 'homePath',
                pageBuilder: (context, state) =>
                    getPage(child: const HomeScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: bookingNavigatorKey,
            routes: [
              GoRoute(
                path: bookingPath,
                name: 'notePath',
                pageBuilder: (context, state) =>
                    getPage(child: const NoteScreen(), state: state),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: noteNavigatorKey,
            routes: [
              GoRoute(
                path: notePath,
                name: 'bookingPath',
                pageBuilder: (context, state) =>
                    getPage(child: const BookingTimeScreen(), state: state),
              )
            ],
          ),
        ],
        pageBuilder: (context, state, navigationShell) => getPage(
            child: MainNavigatorBar(child: navigationShell), state: state),
      ),
    ];
    router = GoRouter(
      routes: routes,
      initialLocation: homePath,
    );
  }

  Page getPage({required Widget child, required GoRouterState state}) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      child: child,
      arguments: state.extra,
    );
  }
}

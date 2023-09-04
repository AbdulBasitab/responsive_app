import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_web_app/Firebase%20Api/firebase_api.dart';
import 'package:responsive_web_app/Screens/content_screens/contacts.dart';
import 'package:responsive_web_app/Screens/content_screens/dashboard.dart';
import 'package:responsive_web_app/Screens/content_screens/item_detail.dart';
import 'package:responsive_web_app/Screens/content_screens/organization.dart';
import 'package:responsive_web_app/Screens/content_screens/profile.dart';
import 'package:responsive_web_app/Screens/content_screens/route.dart' as route;
import 'package:responsive_web_app/Screens/content_screens/users.dart';
import 'package:responsive_web_app/Screens/login_screen/login_screen.dart';
import 'package:responsive_web_app/Utils/data_constants.dart';
import 'package:responsive_web_app/screens/home_screen/home_screen.dart';

class RoutesName {
  static const String homeScreen = 'home';
  static const String loginScreen = 'login';
  static const String dashboard = 'dashboard';
  static const String contacts = 'contacts';
  static const String profile = 'profile';
  static const String users = 'users';
  static const String route = 'route';
  static const String organization = 'organization';
  static const String itemDetail = 'item';
}

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

class RoutesGenrator {
  static final User? user = FirebaseApi.auth.currentUser;
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        path: '/home',
        name: RoutesName.homeScreen,
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        pageBuilder: (context, state, child) => NoTransitionPage(
          child: HomeScreen(
            key: state.pageKey,
            child: child,
          ),
        ),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: RoutesName.dashboard,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const Dashboard(),
            ),
            routes: [
              GoRoute(
                path: 'item:id',
                name: RoutesName.itemDetail,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: ItemDetail(
                    itemIndex: int.parse(state.pathParameters['id']!),
                  ),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: RoutesName.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const Profile(),
            ),
          ),
          GoRoute(
            path: '/contacts',
            name: RoutesName.contacts,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const Contacts(),
            ),
          ),
          GoRoute(
            path: '/users',
            name: RoutesName.users,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const Users(),
            ),
          ),
          GoRoute(
            path: '/route',
            name: RoutesName.route,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const route.Route(),
            ),
          ),
          GoRoute(
            path: '/organization',
            name: RoutesName.organization,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: Organization(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: RoutesName.loginScreen,
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
    ],
    initialLocation: '/home',
    redirect: (context, state) {
      if (state.uri.toString() != '/login') {
        preferences?.setString(deepLinkRouteLocation, state.uri.toString());
        storage?.create(storageDeepLinkRouteLocation, state.uri.toString());
      }
      User? user = FirebaseApi.auth.currentUser;
      debugPrint("Desired Deep Route Location: ${state.uri.toString()}");
      if (user != null && user.uid.isNotEmpty) {
        if (state.uri.toString() == '/home' ||
            state.uri.toString() == '/login') {
          return '/home';
        } else {
          return state.uri.toString();
        }
      } else {
        return '/login';
      }
    },
    errorPageBuilder: (context, state) => const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text("Page Not found Error 404"),
        ),
      ),
    ),
  );
}

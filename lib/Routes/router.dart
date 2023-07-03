import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
import 'package:responsive_web_app/Firebase%20Api/firebase_api.dart';
import 'package:responsive_web_app/Screens/content_screens/contacts.dart';
import 'package:responsive_web_app/Screens/content_screens/dashboard.dart';
import 'package:responsive_web_app/Screens/content_screens/organization.dart';
import 'package:responsive_web_app/Screens/content_screens/profile.dart';
import 'package:responsive_web_app/Screens/content_screens/route.dart' as route;
import 'package:responsive_web_app/Screens/content_screens/users.dart';
import 'package:responsive_web_app/Screens/login_screen/login_screen.dart';
// import 'package:responsive_web_app/provider/responsive_app_provider.dart';
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
      User? user = FirebaseApi.auth.currentUser;
      //var provider = Provider.of<ResponsiveAppProvider>(context);
      if (user != null && user.uid.isNotEmpty) {
        if (state.location == '/home' || state.location == '/login') {
          // context.read<ResponsiveAppProvider>().setSelectedItem('home');
          return '/home';
        } else {
          // context
          //     .read<ResponsiveAppProvider>()
          //     .setSelectedItem(state.name ?? 'dashboard');
          return state.location;
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

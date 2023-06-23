import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_web_app/Firebase%20Api/firebase_api.dart';
import 'package:responsive_web_app/Screens/login_screens/login_screen.dart';
import 'package:responsive_web_app/screens/home_screen/home_screen.dart';

class RoutesName {
  static const String homeScreen = '/';
  static const String loginScreen = '/login';
}

class RoutesGenrator {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.homeScreen,
        name: 'Home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutesName.loginScreen,
        name: 'Login',
        builder: (context, state) => const LoginScreen(),
      )
    ],
    initialLocation: RoutesName.loginScreen,
    redirect: (context, state) {
      User? user = FirebaseApi.auth.currentUser;
      if (user != null && user.uid.isNotEmpty) {
        return RoutesName.homeScreen;
      } else {
        return RoutesName.loginScreen;
      }
    },
    // refreshListenable: ,
    // errorBuilder: (context, state) {
    //   return
    // },
  );
}

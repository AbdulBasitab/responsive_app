import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cache/memory_cache.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/Routes/router.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utils/data_constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) => preferences = value);
  // storage = const FlutterSecureStorage(
  //   webOptions: WebOptions.defaultOptions,
  // );
  storage = MemoryCache();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => ResponsiveAppProvider(),
        child: MaterialApp.router(
          routerConfig: RoutesGenrator.router,
          title: 'Responsive Web App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
                fontSize: 14.spMin,
              ),
            ),
            useMaterial3: true,
          ),
          //: const LoginScreen(),
        ),
      ),
    );
  }
}

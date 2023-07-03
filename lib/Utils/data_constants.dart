import 'package:memory_cache/memory_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preferences;
MemoryCache? storage;
String deepLinkRouteLocation = 'deepLinkRoute';
String storageDeepLinkRouteLocation = 'storageDeepLinkRouteLocation';

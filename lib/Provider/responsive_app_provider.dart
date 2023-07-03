import 'package:flutter/material.dart';

import '../Firebase Api/firebase_api.dart';

class ResponsiveAppProvider extends ChangeNotifier {
  bool _isAppbarCollapsed = false;
  bool _isLoading = false;
  String _selectedItem = 'Dashboard';
  String desiredDeepRouteLocation = '/dashboard';
  final FirebaseApi _firebaseApi = FirebaseApi();

  setIsAppBarCollapsed(bool value) {
    _isAppbarCollapsed = value;
    notifyListeners();
  }

  bool get isAppbarCollapsed => _isAppbarCollapsed;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  void setSelectedItem(String value) {
    _selectedItem = value;
    notifyListeners();
  }

  String get selectedNavItem => _selectedItem;

  void setDesiredDeepRoute(String value) {
    desiredDeepRouteLocation = value;
    notifyListeners();
  }

  Future<String> signInUsingEmail(String email, String password) async {
    setIsLoading(true);
    String result = await _firebaseApi.signInUsingEmail(email, password);
    if (result == 'Success') {
      debugPrint("Succesfully SignedIn");
      setIsLoading(false);
      return "Success";
    } else {
      debugPrint(result);
      setIsLoading(false);
      return result;
    }
  }
}

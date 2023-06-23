import 'package:flutter/material.dart';

import '../Firebase Api/firebase_api.dart';

class ResponsiveAppProvider extends ChangeNotifier {
  bool _isAppbarCollapsed = false;
  String _selectedItem = 'Dashboard';
  final FirebaseApi _firebaseApi = FirebaseApi();

  setIsAppBarCollapsed(bool value) {
    _isAppbarCollapsed = value;
    notifyListeners();
  }

  bool get isAppbarCollapsed => _isAppbarCollapsed;

  setSelectedItem(String value) {
    _selectedItem = value;
    notifyListeners();
  }

  String get selectedNavItem => _selectedItem;

  Future<String> signInUsingEmail(String email, String password) async {
    String result = await _firebaseApi.signInUsingEmail(email, password);
    if (result == 'Success') {
      debugPrint("Succesfully SignedIn");
      return "Success";
    } else {
      debugPrint(result);
      return result;
    }
  }
}

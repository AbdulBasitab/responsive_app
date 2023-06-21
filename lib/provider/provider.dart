import 'package:flutter/material.dart';

class SampleProvider extends ChangeNotifier {
  bool _isAppbarCollapsed = false;
  String _selectedItem = 'My Profile';

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
}

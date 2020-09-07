import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabProvider extends ChangeNotifier {
  String _tab;

  String get tab => _tab;

  TabProvider() {
    _tab = language.dash_bord;
  }

  changeTab(tab_name) {
    _tab = tab_name;
    notifyListeners();
  }
}

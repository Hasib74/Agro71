import 'package:flutter/widgets.dart';

class DataProvider extends ChangeNotifier {
  DataProvider() {
    print("Data provider");
  }

  initial() {
    print("Initial");
  }
}

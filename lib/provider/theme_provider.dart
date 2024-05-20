import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  Brightness brightness = Brightness.dark;
  Brightness brightness1 = Brightness.light;

  void theme(bool value) {
    isDarkMode = value;
    notifyListeners();

  }
  Brightness get themebrigtness => brightness;
}

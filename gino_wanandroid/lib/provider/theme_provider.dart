import 'package:flutter/cupertino.dart';

//主题状态监听
class ThemeProvider with ChangeNotifier {
  late int _themeIndex;

  int get value => _themeIndex;

  void setTheme(int index) async {
    _themeIndex = index;
    notifyListeners();
  }
}

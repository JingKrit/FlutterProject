import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService extends ChangeNotifier {
  bool isLogged = false;

  // Singleton class
  AppService._();
  static final AppService instance = AppService._();

  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentContext!;

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = ((prefs.getBool('isLogin') ?? false));
    isLogged = result;
    notifyListeners();
  }

  void removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
    isLogged = false;
    notifyListeners();
  }

  void saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    isLogged = true;
    notifyListeners();
  }
}

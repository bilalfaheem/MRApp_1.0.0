import 'package:flutter/cupertino.dart';

class LoginPasswordProvider with ChangeNotifier {
  bool _loginpasswordvisibilityprovider = false;
  bool get Loginpasswordvisibilityprovider => _loginpasswordvisibilityprovider;

  void LoginPasswordVisibilityProvider(bool status) {
    _loginpasswordvisibilityprovider = status;
    notifyListeners();
  }
}

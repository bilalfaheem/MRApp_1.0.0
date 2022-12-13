import 'package:flutter/cupertino.dart';

class SocietyNameProvider with ChangeNotifier {

  bool _societyNameVisibilityStatus = false;
  bool get SocietyNameVisibilityStatus => _societyNameVisibilityStatus;

  void societyNameVisibilityProvider(bool status) {
    _societyNameVisibilityStatus = status;
    notifyListeners();
  }
}

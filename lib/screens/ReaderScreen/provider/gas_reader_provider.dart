import 'package:flutter/cupertino.dart';
import 'package:mrapp/screens/ReaderScreen/view/reader_screen.dart';

class GasReaderProvider with ChangeNotifier {
  bool _addressSearching = true;
  bool get addressSearching => _addressSearching;

  bool _meterImage = false;
  bool get meterImage => _meterImage;

  void addressSearchingFunc(bool status) {
    _addressSearching = status;

    if (status == true) {
      addressIdd = "null";
      addressAddress = "null";
      addressPreviousReading = "null";
      _meterImage = false;
    }
    notifyListeners();
  }

  void meterImageFunc(bool status) {
    _meterImage = status;
    notifyListeners();
  }
}

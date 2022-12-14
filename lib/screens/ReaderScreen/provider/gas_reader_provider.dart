import 'package:flutter/cupertino.dart';
import 'package:mrapp/screens/ReaderScreen/view/reader_screen.dart';

class GasReaderProvider with ChangeNotifier {

  bool _addressSearching = true;
  bool get addressSearching => _addressSearching;

  void addressSearchingFunc(bool status) {
    _addressSearching = status;
    notifyListeners();
    if(status == true){
      addressIdd = "null";
      addressAddress = "null";
      addressPreviousReading = "null";
    }
  }
}

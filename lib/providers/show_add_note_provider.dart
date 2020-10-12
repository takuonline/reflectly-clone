import 'package:flutter/material.dart';



class IsPopUpOn with ChangeNotifier {
  bool _isPopUpOn =false;
  bool  get isPopUpOn => _isPopUpOn;


  void togglePopUp() {
    _isPopUpOn = !_isPopUpOn;
    notifyListeners();
  }
}


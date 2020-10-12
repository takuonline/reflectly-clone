import 'package:flutter/material.dart';

class isActivitiesButtonDisabled with ChangeNotifier {
  bool _isButtonDisabled =true;
  bool  get isButtonDisabled => _isButtonDisabled;


  void setButtonDisabled(bool value) {
    _isButtonDisabled = value;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';



class OnBoardingValue with ChangeNotifier {


  double _value = 2.5;
  double  get value => _value;

  void setValue(double value) {
    _value = value;

    notifyListeners();
  }

}
import 'package:flutter/material.dart';



class SliderValue with ChangeNotifier {
  double _sliderValue = 2.5;
  double  get sliderValue => _sliderValue;

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

}
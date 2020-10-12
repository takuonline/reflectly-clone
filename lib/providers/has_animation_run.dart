import 'package:flutter/material.dart';

class HasAnimationRun with ChangeNotifier {


  //checks if the animation in signin when user first opens app has run
  bool _hasAnimationRun = false;
  bool  get hasAnimationRun => _hasAnimationRun;


  void setAnimationRun(value) {
    _hasAnimationRun = value;
    notifyListeners();
  }
}
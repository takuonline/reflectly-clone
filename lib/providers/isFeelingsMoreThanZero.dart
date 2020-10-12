import 'package:flutter/material.dart';



class FeelingsIsMoreThanZero with ChangeNotifier {
  bool _feelingsIsMoreThanZero= false;
  bool  get feelingsIsMoreThanZero => _feelingsIsMoreThanZero;

  void toggleFeelingsIsMoreThanZero(bool value) {
    print('Running activities is more than zero');
    _feelingsIsMoreThanZero = value;
    notifyListeners();
  }

}
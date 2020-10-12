import 'package:flutter/material.dart';
import 'package:my_reflectly/pages/notes.dart';


class ActivitiesIsMoreThanZero with ChangeNotifier {
  bool _activitiesIsMoreThanZero= false;
  bool  get activitiesIsMoreThanZero => _activitiesIsMoreThanZero;

  void toggleActivitiesIsMoreThanZero(bool value) {
    print('Running activities is more than zero');

    _activitiesIsMoreThanZero = value;

    notifyListeners();
  }

}
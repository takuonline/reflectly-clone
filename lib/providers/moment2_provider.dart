
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';



class ActivitiesMoments with ChangeNotifier {
  List<NoteIconsWithNames> _activitiesList = [];

  List<NoteIconsWithNames> get activitiesList {
    return [..._activitiesList];
  }

  void addActivityMoment(NoteIconsWithNames value) {
    _activitiesList.add(value);
    notifyListeners();
  }
  void removeActivityMoment(String title) {
    _activitiesList.removeWhere((element) => element.title==title);
    notifyListeners();
  }

  void clearActivityMoment() {
    _activitiesList.clear();
    notifyListeners();
  }

}


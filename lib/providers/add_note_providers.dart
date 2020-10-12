import 'package:flutter/material.dart';


class AddMoment with ChangeNotifier {
  bool _showAddNote= false;
  bool  get showAddNote => _showAddNote;

  void toggleAddNote() {
    print('Running closeADDNote');

    _showAddNote = !_showAddNote;
//
//    if (_showAddNote){
//      _showAddNote = false;
//    }else{
//      _showAddNote = true;
//    }
    notifyListeners();
  }

}
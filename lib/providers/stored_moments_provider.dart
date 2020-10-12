import 'package:flutter/material.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';

class StoredMoments with ChangeNotifier {
  List<IconMoment> _items = [];

  List<IconMoment> get items {
    return [..._items];
  }

  void addMoment(IconMoment value) {
    _items.add(value);

    notifyListeners();
  }

  void removeMoment(int index) {
    _items.removeAt(index);

    notifyListeners();
  }
}

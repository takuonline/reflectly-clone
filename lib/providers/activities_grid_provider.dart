import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';

class ActivitiesGridItem {
  ActivitiesGridItem(
      {@required this.title,
      @required this.icon,
      this.activities,
      this.isButtonDisabled});

  IconData icon;
  String title;
  List<NoteIconsWithNames> activities;
  bool isButtonDisabled = true;
}

class GridActivityList with ChangeNotifier {


  List<ActivitiesGridItem> _gridActivityList = [
    ActivitiesGridItem(
      title: 'work',
      icon: Icons.work,
    ),
    ActivitiesGridItem(
      title: 'travel',
      icon: Icons.card_travel,
    ),
    ActivitiesGridItem(
      title: 'music',
      icon: Icons.headset,
    ),
    ActivitiesGridItem(
      title: 'school',
      icon: Icons.school,
    ),
    ActivitiesGridItem(
      title: 'home',
      icon: Icons.home,
    ),
    ActivitiesGridItem(
      title: 'android',
      icon: Icons.android,
    ),
    ActivitiesGridItem(
      title: 'money',
      icon: Icons.attach_money,
    ),
    ActivitiesGridItem(
      title: 'party',
      icon: Icons.cake,
    ),
    ActivitiesGridItem(
      title: 'health',
      icon: Icons.healing,
    ),
    ActivitiesGridItem(
      title: 'food',
      icon: Icons.fastfood,
    ),
    ActivitiesGridItem(
      title: 'pass',
      icon: Icons.done,
    ),
    ActivitiesGridItem(
      title: 'shopping',
      icon: Icons.shopping_basket,
    ),
    ActivitiesGridItem(
      title: 'work2',
      icon: Icons.work,
    ),
    ActivitiesGridItem(
      title: 'travel2',
      icon: Icons.card_travel,
    ),
    ActivitiesGridItem(
      title: 'music2',
      icon: Icons.headset,
    ),
    ActivitiesGridItem(
      title: 'school2',
      icon: Icons.school,
    ),
    ActivitiesGridItem(
      title: 'home2',
      icon: Icons.home,
    ),
  ];

  List<ActivitiesGridItem> get gridActivityList {
    return [..._gridActivityList];
  }
}


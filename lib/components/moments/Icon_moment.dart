import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';



class IconMoment {
  String moodText;
  IconData moodIcon;


  String title;
  String addSomeNotes;

  List<NoteIconsWithNames> activities;
  List<NoteIconsWithNames> feelings;

  DateTime time;
  String id;
  File file;

  IconMoment(
      {this.moodText,
      this.moodIcon,

      this.activities,
      this.feelings,

      this.title,
      this.addSomeNotes,

      this.time,
        this.file


      });
}

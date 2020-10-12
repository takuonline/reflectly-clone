import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';

//
//class ShowAddNoteDialog extends StatelessWidget {
//  @override
//  Future<void> build(BuildContext context) {
//    return showDialog<void>(
//      context: context,
//      builder: (BuildContext context) {
//        return
//      },
//    );
//  }
//}

class ShowAddNoteDialog {
  static  Future<void> displayDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddNotePageView();
      },
    );
  }
}

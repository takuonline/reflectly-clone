import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/moment_1.dart';
import 'package:my_reflectly/components/add_note/moment_2.dart';
import 'package:my_reflectly/components/add_note/moment_3.dart';
import 'package:my_reflectly/components/add_note/moment_4.dart';
import 'package:my_reflectly/providers/activites_grid_button_provider.dart';
import 'package:my_reflectly/providers/activities_grid_provider.dart';

import 'package:my_reflectly/providers/add_note_providers.dart';
import 'package:my_reflectly/providers/isActivitesMoreThanZero.dart';
import 'package:my_reflectly/providers/isFeelingsMoreThanZero.dart';
import 'package:my_reflectly/providers/moment2_provider.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:my_reflectly/providers/sliderValue_provider.dart';

import 'package:provider/provider.dart';

class NoteIconsWithNames {
  NoteIconsWithNames({this.title, this.icon});
  String title;
  IconData icon;
}

class AddNotePageView extends StatefulWidget {
  @override
  _AddNotePageViewState createState() => _AddNotePageViewState();
}

class _AddNotePageViewState extends State<AddNotePageView> {
  PageController controller;

  double sliderValue = 3;

  List<NoteIconsWithNames> activities;
  List<NoteIconsWithNames> feelings = [];

  String momentTitle;
  String momentText;

  bool hasChanged = false;


  void showValue() {
    print(sliderValue);
  }



  @override
  Widget build(BuildContext context) {
    controller = PageController(
      initialPage: 0,
    );

    activities = context.watch<ActivitiesMoments>().activitiesList;



    final pageView = Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  //show date picker
                },
                icon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ActivitiesMoments>().clearActivityMoment();
                  context.read<SliderValue>().setSliderValue(2.5);
                  context.read<ActivitiesIsMoreThanZero>().toggleActivitiesIsMoreThanZero(false);
                  context.read<FeelingsIsMoreThanZero>().toggleFeelingsIsMoreThanZero(false);
                  print('item x pressed');
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        PageView(

          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            Moment1(controller,hasChanged),
            MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: GridActivityList()),
                ChangeNotifierProvider.value(value: isActivitiesButtonDisabled())
              ],
              child: Moment2(controller,),
            ),
            Moment3(controller, feelings),
            Moment4(
                controller,
                activities,
                feelings,
                momentTitle,
                momentText,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(37.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: FlutterLogo(
              size:40,
              colors: Colors.red,
            ),
          ),
        )
      ],
    );

    return Dismissible(
      key: ValueKey('dismissible'),
      direction: DismissDirection.down,
      onDismissed: (direction) {

      Navigator.pop(context);

        context.read<ActivitiesMoments>().clearActivityMoment();
        context.read<SliderValue>().setSliderValue(2.5);
        context.read<ActivitiesIsMoreThanZero>().toggleActivitiesIsMoreThanZero(false);
      context.read<FeelingsIsMoreThanZero>().toggleFeelingsIsMoreThanZero(false);
      },
      dismissThresholds: {
        DismissDirection.down: .2,
      },
      child: DraggableScrollableSheet(
        minChildSize: .9,
        initialChildSize: .9,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenheight = MediaQuery.of(context).size.height;

          return Material(
              color: Color(0xff0093E9),

           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.vertical(top: Radius.circular(30))
           ),
              child: pageView);
        },
      ),
    );
    ;
  }
}

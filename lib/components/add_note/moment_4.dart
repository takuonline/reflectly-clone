import 'package:flutter/material.dart';
import 'package:my_reflectly/components/buttons/custom_raised_button.dart';

import 'package:my_reflectly/providers/add_note_providers.dart';
import 'package:my_reflectly/providers/isActivitesMoreThanZero.dart';
import 'package:my_reflectly/providers/isFeelingsMoreThanZero.dart';
import 'package:my_reflectly/providers/moment2_provider.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:my_reflectly/providers/sliderValue_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';
import 'package:my_reflectly/providers/stored_moments_provider.dart';
import 'add_note_pageview.dart';

class Moment4 extends StatefulWidget {
  PageController controller;

  List<NoteIconsWithNames> activities;
  List<NoteIconsWithNames> feelings;

  String momentTitle;
  String momentText;

//  double sliderValue=3;

//  Function showValue;

  Moment4(this.controller, this.activities, this.feelings, this.momentTitle,
      this.momentText, );
  @override
  _Moment4State createState() => _Moment4State();
}

class _Moment4State extends State<Moment4> {
  bool onWillPop() {
    widget.controller.previousPage(
      duration: Duration(milliseconds: 800),
      curve: Curves.linear,
    );
    return false;
  }

  void saveMoment() {
    IconData _icon;
    String _mood;
    double _sliderValue = context.read<SliderValue>().sliderValue;
    if (_sliderValue < 1) {
      _icon = Icons.sentiment_very_dissatisfied;
      _mood = 'REALLY TERRIBLE';
    } else if (_sliderValue <= 2) {
      _icon = Icons.sentiment_dissatisfied;
      _mood = 'SOMEWHAT BAD';
    } else if (_sliderValue <= 3) {
      _icon = Icons.sentiment_neutral;
      _mood = 'COMPLETELY OK';
    } else if (_sliderValue <= 4) {
      _icon = Icons.sentiment_satisfied;
      _mood = 'PRETTY GOOD';
    } else if (_sliderValue <= 5) {
      _icon = Icons.sentiment_very_satisfied;
      _mood = 'SUPER AWESOME';
    }

    IconMoment iconMoment = IconMoment(
      feelings: widget.feelings,
      activities: widget.activities,
      addSomeNotes: widget.momentText ?? '',
      title: widget.momentTitle ?? _mood,
      moodIcon: _icon,
      moodText: _mood ,
      time: DateTime.now()
    );

    context.read<StoredMoments>().addMoment(iconMoment);
    context.read<ActivitiesIsMoreThanZero>().toggleActivitiesIsMoreThanZero(false);
    context.read<FeelingsIsMoreThanZero>().toggleFeelingsIsMoreThanZero(false);
  }

  @override
  Widget build(BuildContext context) {

    bool clicked= true;

    double _keyBoardInset =MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                Text(
                      '19. August, 12:48 AM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),

                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: <Widget>[
                      Text(
                        'Activities',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.black.withOpacity(.1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 40),
                        child: SizedBox(
                          height: 53,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: ScrollController(),
                            itemCount: widget.activities.length,
                            itemBuilder: (context, index) {
                              return feelingsItem(
                                icon: widget.activities[index].icon,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: <Widget>[
                      Text(
                        'Feelings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.black.withOpacity(.1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 40),
                        child: SizedBox(
                          height: 53,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: ScrollController(),
                            itemCount: widget.feelings.length,
                            itemBuilder: (context, index) {
                              return feelingsItem(
                                icon: widget.feelings[index].icon,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        onTap: () {},
                        onChanged: (text) {
                          setState(() {
                            widget.momentTitle = text;
                          });
                        },
                        cursorColor: Colors.purpleAccent,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Moment title ...',
                            hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding:  EdgeInsets.only(
                        left: 20,
                          right: 20,
                           top: 10,
                      bottom:     10),
                      child: TextFormField(
                        onTap: () {},
                        onChanged: (text) {
                          setState(() {
                            widget.momentText = text;
                          });
                        },
                        minLines: 4,
                        maxLines: 10,
                        cursorColor: Colors.purpleAccent,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add some notes ...',
                          hintStyle:
                              TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: _keyBoardInset,
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:  CustomRaisedButton(
                clicked: clicked,
                controller: widget.controller,
                btnText: 'SAVE MOMENT',
onBtnPressed: (){
  saveMoment();
//  context.read<AddMoment>().toggleAddNote();
  Navigator.pop(context);

  context.read<SliderValue>().setSliderValue(2.5);
  context.read<ActivitiesMoments>().clearActivityMoment();
},

              ),
            ),
          ),
        ],
      ),
    );
  }
}

class feelingsItem extends StatelessWidget {
  IconData icon;

  feelingsItem({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13),
        child: Column(
          children: <Widget>[
            Center(
              child: Icon(
                icon,
                color: Color(0xff0093E9),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class activitiesItem extends StatelessWidget {
  const activitiesItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13),
        child: Column(
          children: <Widget>[
            Center(
              child: Icon(
                Icons.work,
                color: Color(0xff0093E9),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/moment_4.dart';
import 'package:my_reflectly/components/buttons/custom_raised_button.dart';
import 'package:my_reflectly/pages/notes.dart';
import 'package:my_reflectly/providers/sliderValue_provider.dart';
import 'package:my_reflectly/providers/username_provide.dart';

import 'package:provider/provider.dart';
import 'package:my_reflectly/providers/add_note_providers.dart';

class Moment1 extends StatefulWidget {
  PageController controller;
  bool isChanged;

  Moment1(this.controller, this.isChanged);
  @override
  _Moment1State createState() => _Moment1State();
}

class _Moment1State extends State<Moment1> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Offset> slideAnimation1;
  Animation<double> fadeAnimation1;

  Animation<Offset> slideAnimation2;
  Animation<double> fadeAnimation2;

  Animation<Offset> slideAnimation3;
  Animation<double> fadeAnimation3;

  Animation<double> scaleBtnAnimation;

  IconData _icon = Icons.sentiment_neutral;
  String _mood = 'COMPLETELY OKAY';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000));

    _controller.forward();

    //animation for the first piece of text
    slideAnimation1 = Tween<Offset>(begin: Offset(0, .5), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(.3, .5, curve: Curves.ease)));

    fadeAnimation1 =
        CurvedAnimation(curve: Interval(.3, .5,curve: Curves.ease), parent: _controller);

    //animation for the first piece of text
    slideAnimation2 = Tween<Offset>(begin: Offset(0, .3), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(.5, .7, curve: Curves.ease)));

    fadeAnimation2 =
        CurvedAnimation(curve: Interval(.5, .7,curve: Curves.ease), parent: _controller);

    //animation for the first piece of text
    slideAnimation3 = Tween<Offset>(begin: Offset(0, .3), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(.7, .9, curve: Curves.ease)));

    fadeAnimation3 =
        CurvedAnimation(curve: Interval(.7, .9,curve: Curves.ease), parent: _controller);

    scaleBtnAnimation =
        CurvedAnimation(curve: Interval(.8, 1,curve: Curves.elasticOut), parent: _controller);
  }

  String _determineTimeOfDay() {
    int timeOfDay = DateTime.now().toLocal().hour;

    if (timeOfDay < 12 || timeOfDay == 0) {
      return 'morning';
    } else if (timeOfDay < 18) {
      return 'afternoon';
    } else if (timeOfDay < 24) {
      return 'evening';
    } else {
      return 'day';
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _sliderValue = context.watch<SliderValue>().sliderValue;
    String timeOfDay = _determineTimeOfDay();
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: FadeTransition(
            opacity: fadeAnimation1,
            child: SlideTransition(
              position: slideAnimation1,
              child: Text(
                'Hey ${context.watch<UserName>().userName} How are you this fine $timeOfDay?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FadeTransition(
          opacity: fadeAnimation2,
          child: SlideTransition(
            position: slideAnimation2,
            child: Column(
              children: [
                Icon(
                  _icon,
                  size: 120,
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  '$_mood',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        FadeTransition(
          opacity: fadeAnimation3,
          child: SlideTransition(
            position: slideAnimation3,
            child: Slider(
              min: 0,
              max: 5,
              onChangeStart: (value) {
                setState(() {
                  widget.isChanged = true;
                });
              },
              onChanged: (value) {
                setState(
                  () {
                    context.read<SliderValue>().setSliderValue(value);
                    if (_sliderValue < 1) {
                      _icon = Icons.sentiment_very_dissatisfied;
                      _mood = 'REALLY TERRIBLE';
                    } else if (_sliderValue <= 2) {
                      _icon = Icons.sentiment_dissatisfied;
                      _mood = 'SOMEWHAT BAD';
                    } else if (_sliderValue <= 3) {
                      _icon = Icons.sentiment_neutral;
                      _mood = 'COMPLETELY OKAY';
                    } else if (_sliderValue <= 4) {
                      _icon = Icons.sentiment_satisfied;
                      _mood = 'PRETTY GOOD';
                    } else if (_sliderValue <= 5) {
                      _icon = Icons.sentiment_very_satisfied;
                      _mood = 'SUPER AWESOME';
                    }
                  },
                );
              },
              value: context.watch<SliderValue>().sliderValue,
              inactiveColor: Colors.black.withOpacity(.1),
              activeColor: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ScaleTransition(
          scale: scaleBtnAnimation,
          child: CustomRaisedButton(
            clicked: widget.isChanged,
            controller: widget.controller,
            btnText: 'Continue',
          ),
        ),
      ],
    ));
  }
}

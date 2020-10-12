import 'package:flutter/material.dart';
import 'package:my_reflectly/pages/notes.dart';
import 'package:my_reflectly/providers/images_provider.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';
import 'package:provider/provider.dart';

class SignInReminders extends StatefulWidget {
  static String id = 'SignInReminders';

  PageController controller;

  SignInReminders(this.controller);

  @override
  _SignInRemindersState createState() => _SignInRemindersState();
}

class _SignInRemindersState extends State<SignInReminders> {
  final stats = Text(
    '88% more likely',
    style: TextStyle(color: Colors.black),
  );
  Future<void> ReminderDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            'ARE YOU SURE?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          content: Text(
            'Studies show that people who get daily reminders are 88% more likely to keep their new habit!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.done,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<DPImagesProvider>(context,listen: false).fillUpList();
                Navigator.pushReplacementNamed(context, Moments.id);
              },
            ),
          ],
        );
      },
    );
  }
  bool onWillPop() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    context.read<OnBoardingValue>().setValue(screenWidth*.37);
    widget.controller.previousPage(
      duration: Duration(milliseconds:500),
      curve: Curves.easeInExpo,
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0093E9), Color(0xff0093E9)],
//            colors: [Color(0xff0093E9), Color(0xff00AAE9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              children: <Widget>[

              SizedBox(
                height: 80,
              ),
                Text(
                  'Last thing- want me to send you small reminders?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(
                  height: 180,
                ),
//                Image.network(src),
                RaisedButton(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                  onPressed: () {

                  Navigator.pushReplacementNamed(context, Moments.id);
                  Provider.of<DPImagesProvider>(context,listen: false).fillUpList();

                  },
                  child: Text(
                    'YES PLEASE!',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0093E9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                FlatButton(
                  onPressed: () {
                    ReminderDialog();
                  },
                  child: Text('NO THANKS'),
                ),
                SizedBox(
                  height: 41,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

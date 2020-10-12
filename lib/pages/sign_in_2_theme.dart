import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_reflectly/pages/sign_in_3_reminders.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:my_reflectly/transition_manager/custom_manager.dart';

import 'package:provider/provider.dart';


class SignInTheme extends StatefulWidget {
  static String id = 'SignInTheme';

  PageController controller;

  SignInTheme(this.controller);

  @override
  _SignInThemeState createState() => _SignInThemeState();
}

class _SignInThemeState extends State<SignInTheme> {
  int _focusedIndex = 0;
  List<Color> colorsList = [
    Colors.black,
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.purple
  ];

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {


    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: colorsList[index],
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
  bool onWillPop() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    context.read<OnBoardingValue>().setValue(screenWidth*.30);
    widget.controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInExpo,
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff0093E9), Color(0xff0093E9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: 80,
                ),
                Text(
                  'Boom - magic color change!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),SizedBox(
                  height: 10,
                ),
                Text(
                  'CAN BE CHANGED LATER IN SETTINGS',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black38
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
                Container(
                  constraints:BoxConstraints(
                    maxHeight: 90
                  ) ,
                  child: ScrollSnapList(

                    onItemFocus: _onItemFocus,
                    itemSize: 100,
                    itemBuilder: _buildListItem,
                    itemCount: colorsList.length,
                    scrollDirection: Axis.horizontal,
                    dynamicItemSize: true,
                    initialIndex: 0,
                  ),
                ),
                Spacer(

                ),
                RaisedButton(
                  disabledColor: Colors.black12.withOpacity(.1),
                  disabledTextColor: Colors.black38,
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                  onPressed: () {


                    context.read<OnBoardingValue>().setValue(screenWidth*.44);

                    widget.controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);

                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0093E9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 43,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

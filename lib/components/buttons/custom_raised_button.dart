import 'package:flutter/material.dart';
import 'package:my_reflectly/providers/isFeelingsMoreThanZero.dart';
import 'package:provider/provider.dart';



class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    @required this.clicked,
    @required this.controller,
    @required this.btnText,
    this.onBtnPressed
  });

  final bool clicked;
  final PageController controller;
  final String btnText;
   Function onBtnPressed;

  @override
  Widget build(BuildContext context) {



    onBtnPressed ??= () {
      controller.nextPage(
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOut);
    } ;


    return RaisedButton(
      disabledColor: Colors.black12.withOpacity(.1),
      disabledTextColor: Colors.black38,
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
      onPressed: clicked
          ? onBtnPressed
          : null,
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w700,
          color: Color(0xff0093E9),
        ),
      ),
    );
  }
}

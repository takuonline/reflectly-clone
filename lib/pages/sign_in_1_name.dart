import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/constants.dart';
import 'package:my_reflectly/pages/sign_in_2_theme.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';
import 'package:my_reflectly/providers/username_provide.dart';
import 'package:my_reflectly/transition_manager/custom_manager.dart';
import 'package:provider/provider.dart';

class SignInName extends StatefulWidget {
  static String id = '/SingInName';

  PageController controller;
  bool isEnteringName;
  final VoidCallback reverseAnimation;

  SignInName(this.controller, this.isEnteringName,this.reverseAnimation);
  @override
  _SignInNameState createState() => _SignInNameState();
}

class _SignInNameState extends State<SignInName> {
  bool onWillPop() {
    widget.controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInExpo,
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOff =  MediaQuery.of(context).viewInsets.bottom == 0;
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
            margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds:700),
                  height:isKeyboardOff ? 80:10,
                  curve: Curves.ease,
                ),
                Text(
                  'So nice to meet you! What do your friends call you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
                Flexible(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
                Container(
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(.05),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        TextFormField(
                          onEditingComplete: () {
                          },
                          onChanged: (value){

                            if( value.length<=20){
                              context.read<UserName>().setUserName(value);
                            }

                          },

                          onFieldSubmitted: (value) {

                            // sets the value of username
                            if( value.length<=20){
                              context.read<UserName>().setUserName(value);
                            }

                            //closes keyboard on submit
                            FocusScope.of(context).requestFocus(new FocusNode());
                          },


                          maxLines: 1,
                          initialValue: context.watch<UserName>().userName ,

                          textAlign: TextAlign.center,
                          cursorColor: Colors.purpleAccent,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your nickname...',
                              hintStyle:
                                  TextStyle(color: Colors.white70, fontSize: 20)),
                        ),
                        if( context.watch<UserName>().userName!='') TextCounter(

                         textCount: context.watch<UserName>().userName,

                        )
                      ],
                    ),
                  ),
                ),

                Flexible(
                  child: AnimatedContainer(
                   duration: Duration(seconds: 1),
                    height: 100,
                  ),
                ),

                Spacer(),
                Visibility(
                  visible:  isKeyboardOff ? true : false,
                  maintainSize: false,
                  child: RaisedButton(
                    disabledColor: Colors.black12.withOpacity(.1),
                    disabledTextColor: Colors.black38,
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 20.0),
                    onPressed:

                    context.watch<UserName>().userName==''? null:()



                    {

                      context.read<OnBoardingValue>().setValue(screenWidth*.37);

                      widget.controller.nextPage(
                          duration: Duration(milliseconds:500),
                          curve: Curves.ease );

                    },
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0093E9),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
   TextCounter({
    this.textCount,
    Key key,
  }) : super(key: key);

  String textCount;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(
       20,-20
                         ),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${textCount.length}/20',style: TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
            ),
          ),
        ),
      ),
    );
  }
}

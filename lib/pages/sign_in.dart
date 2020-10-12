import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/animatedWidget/animated_logo.dart';
import 'package:my_reflectly/pages/notes.dart';
import 'package:my_reflectly/pages/sign_in_1_name.dart';
import 'package:my_reflectly/pages/sign_in_2_theme.dart';
import 'package:my_reflectly/pages/sign_in_3_reminders.dart';
import 'package:my_reflectly/providers/has_animation_run.dart';
import 'package:my_reflectly/providers/images_provider.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';

import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static String id = 'SignIn';
  final PageController controller;
  final VoidCallback runAnimation;

//  Animation<double> flutterLogoSize;

  SignIn(
    this.controller,
    this.runAnimation,

//    this.flutterLogoSize,
  );

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<Offset> _slideAnimation;
  Animation<double> _fadeAnimation;

  Animation<Offset> _slideAnimation2;
  Animation<double> _fadeAnimation2;

  Animation<double> _fadeAnimation3;

  Animation<double> _scaleAnimation;
  Animation<double> _scaleAnimation2;

  @override
  void initState() {
    super.initState();

    // animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    context.read<HasAnimationRun>().hasAnimationRun
        ? print('animation has already run ')
        : _animationController.forward();

    //animation for the first piece of text
    _slideAnimation = Tween<Offset>(begin: Offset(0, .3), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(.2, .4, curve: Curves.ease)));

    _fadeAnimation =
        CurvedAnimation(curve: Interval(.2, .4), parent: _animationController);

    //animation for the second piece of text
    _slideAnimation2 = Tween<Offset>(begin: Offset(0, .3), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(.4, .6, curve: Curves.ease)));

    _fadeAnimation2 =
        CurvedAnimation(curve: Interval(.4, .6), parent: _animationController);

    //animation for the third piece of text
    _fadeAnimation3 = CurvedAnimation(
        curve: Interval(.6, .7, curve: Curves.ease),
        parent: _animationController);

    // animation for the 2 buttons below

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        curve: Interval(.7, .9, curve: Curves.elasticOut),
        parent: _animationController));

    _scaleAnimation2 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        curve: Interval(.75, .95, curve: Curves.elasticOut),
        parent: _animationController));

    setState(() => _animationController.notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool onWillPop() {
    widget.runAnimation();
    widget.controller.previousPage(
      duration: Duration(milliseconds: 300),
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
        body: context.watch<HasAnimationRun>().hasAnimationRun
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff0093E9), Color(0xff0093E9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Container(
                  width: 50.0,
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      left: 45, top: 140, right: 45, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hi there,',
                        textAlign: TextAlign.center,
                        style: TextStyle(
//                    fontFamily: 'Quicksand',
                            color: Colors.white.withOpacity(.8),
                            fontSize: 30.0,
                            letterSpacing: .7,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'l\'m a Reflectly clone',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: .7,
                            color: Colors.white.withOpacity(.8),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Your new personal self-care companion',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 20),
                      ),
                      Spacer(),
                      RaisedButton(
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 20.0),
                          onPressed: () {
                            widget.runAnimation();
                            context
                                .read<HasAnimationRun>()
                                .setAnimationRun(true);
                            widget.controller.animateToPage(1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: Text(
                            'HI, REFLECTLY!',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff0093E9),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        onPressed: () {
                          Provider.of<DPImagesProvider>(context, listen: false)
                              .fillUpList();

                          Navigator.pushReplacementNamed(context, Moments.id);
                        },
                        child: Text(
                          'I ALREADY HAVE AN ACCOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white54, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff0093E9), Color(0xff0093E9)],
//            colors: [Color(0xff0093E9), Color(0xff00AAE9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Container(
                  width: 50.0,
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      left: 45, top: 140, right: 45, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'Hi there,',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: .7,
                                color: Colors.white.withOpacity(.8),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _fadeAnimation2,
                        child: SlideTransition(
                          position: _slideAnimation2,
                          child: Text(
                            'l\'m a Reflectly clone',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0,
                                letterSpacing: .7,
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeTransition(
                        opacity: _fadeAnimation3,
                        child: Text(
                          'Your new personal self-care companion',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white54, fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: RaisedButton(
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 20.0),
                            onPressed: () {
                              context
                                  .read<HasAnimationRun>()
                                  .setAnimationRun(true);
                              widget.controller.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut);

                              context.read<OnBoardingValue>().setValue(screenWidth*.30);
                            },
                            child: Text(
                              'HI, REFLECTLY!',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w900,
                                color: Color(0xff0093E9),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ScaleTransition(
                        scale: _scaleAnimation2,
                        child: FlatButton(
                          onPressed: () {
                            Provider.of<DPImagesProvider>(context,listen: false).fillUpList();
                            Navigator.pushReplacementNamed(context, Moments.id);
                          },
                          child: Text(
                            'I ALREADY HAVE AN ACCOUNT',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white54, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class OnBoardingIndicator extends StatefulWidget {
  OnBoardingIndicator({key, this.color, this.position}) : super(key: key);

  final Color color;
  double position;

  @override
  _OnBoardingIndicatorState createState() => _OnBoardingIndicatorState();
}

class _OnBoardingIndicatorState extends State<OnBoardingIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: widget.position,
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        height: 10,
        width: 10,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

//class SlideLeftRoute extends PageRouteBuilder {
//  final Widget enterWidget;
//  final Widget oldWidget;
//
//  SlideLeftRoute({this.enterWidget, this.oldWidget})
//      : super(
//      transitionDuration: Duration(milliseconds: 600),
//      pageBuilder: (BuildContext context, Animation<double> animation,
//          Animation<double> secondaryAnimation) {
//        return enterWidget;
//      },
//      transitionsBuilder: (BuildContext context,
//          Animation<double> animation,
//          Animation<double> secondaryAnimation,
//          Widget child) {
//        return Stack(
//          children: <Widget>[
//            SlideTransition(
//                position: new Tween<Offset>(
//                  begin: const Offset(0.0, 0.0),
//                  end: const Offset(-1.0, 0.0),
//                ).animate(animation),
//                child: oldWidget),
//            SlideTransition(
//                position: new Tween<Offset>(
//                  begin: const Offset(1.0, 0.0),
//                  end: Offset.zero,
//                ).animate(animation),
//                child: enterWidget)
//          ],
//        );
//      });
//}

//Route _createRoute() {
//  return PageRouteBuilder(
//    pageBuilder: (context, animation, secondaryAnimation) => SignInName(),
//    transitionsBuilder: (context, animation, secondaryAnimation, child) {
//      var begin = Offset(1.0, 0.0);
//      var end = Offset.zero;
//      var curve = Curves.ease;
//
//      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//      return SlideTransition(
//        position: animation.drive(tween),
//        child: child,
//      );
//    },
//  );
//}

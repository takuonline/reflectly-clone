import 'package:flutter/material.dart';
import 'package:my_reflectly/pages/sign_in.dart';
import 'package:my_reflectly/pages/sign_in_1_name.dart';
import 'package:my_reflectly/pages/sign_in_2_theme.dart';
import 'package:my_reflectly/pages/sign_in_3_reminders.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';

import 'package:provider/provider.dart';

class SignInPageView extends StatefulWidget {
  @override
  _SignInPageViewState createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView>
    with SingleTickerProviderStateMixin {
  bool isIndicatorVisible = false;
  bool hasTappedOnTextField = false;
  AnimationController animationController;

  double overBoardIndicatorPosition;

  //logo animations
  Animation<double> scaleAnimation;
  Animation<double> slideLogoUpAnimation;

  //onboarding indicator animation
  Animation<Offset> slideUpAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    scaleAnimation = Tween<double>(begin: 1, end: .6).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, .65, curve: Curves.easeIn)));

    slideUpAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOutCirc));

    slideLogoUpAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(.35, 1, curve: Curves.easeIn),
      ),
    );
  }

  void runAnimation() {
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    double onBoardingNameItem = screenWidth * 30 / 100;
    double onBoardingThemeItem = screenWidth * 37 / 100;
    double onBoardingReminderItem = screenWidth * 44 / 100;
    double onBoardingItem;

    PageController controller;
    int pageIndex = 0;

    controller = PageController(
      initialPage: 0,
    );

    GlobalKey key1 = GlobalKey();
    GlobalKey key2 = GlobalKey();
    GlobalKey key3 = GlobalKey();
    GlobalKey key4 = GlobalKey();
//

//    RenderBox box = key1.currentContext.findRenderObject();
//    Offset position = box.localToGlobal(Offset.zero); //this is global position
//    double y1 = position.dy;
//    double x1= position.dx;
    return Stack(
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          onPageChanged: (index) {
            print(index);

            switch (index) {
              case 0:
                setState(() {
                  print(onBoardingItem);
                  animationController.reverse();
                  isIndicatorVisible = false;
                });
                break;
              case 1:
                setState(() {
                  animationController.forward();
                  onBoardingItem = onBoardingNameItem;
                  isIndicatorVisible = true;
                  print(onBoardingItem);
                });
                break;
              case 2:
                setState(() {
                  isIndicatorVisible = true;
                  onBoardingItem = onBoardingThemeItem;
                  print(onBoardingItem);
                });
                break;
              case 3:
                setState(() {
                  isIndicatorVisible = true;
                  onBoardingItem = onBoardingReminderItem;
                });
                break;
            }

            setState(() {
              pageIndex = index;
            });
          },
          children: <Widget>[
            SignIn(
              controller,
              runAnimation,
            ),
            SignInName(controller, hasTappedOnTextField, reverseAnimation),
            SignInTheme(controller),
            SignInReminders(controller)
          ],
        ),
        Stack(
          children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.ease,
                top: MediaQuery.of(context).viewInsets.bottom == 0 ? 0 : -200,
                child: AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (BuildContext context, Widget child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (slideLogoUpAnimation.value)),
                        child: Transform.scale(
                            scale: scaleAnimation.value,
                            child: LogoAnimation()),
                      );
                    },
                    child: LogoAnimation())),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 40,
          right: 40,
          child: SlideTransition(
            position: slideUpAnimation,
            child: Visibility(
              visible: isIndicatorVisible,
              maintainSize: false,
              child: Container(
                width: 90,
                height: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    OnBoardingIndicator(
                        position: onBoardingNameItem, color: Colors.grey),
                    OnBoardingIndicator(
                        position: onBoardingThemeItem, color: Colors.grey),
                    OnBoardingIndicator(
                        position: onBoardingReminderItem, color: Colors.grey),
                    OnBoardingIndicator(
                        position: context.watch<OnBoardingValue>().value,
                        color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _controller.forward();

    _animation = Tween<double>(begin: 0, end: .9).animate(CurvedAnimation(
      curve: Curves.elasticOut,
      parent: _controller,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          builder: (BuildContext context, Widget child) {
            return ScaleTransition(scale: _animation, child: child);
          },
          child: Container(
            margin: EdgeInsets.only(left: screenWidth / 2.7),
            alignment: Alignment.topCenter,
            child: FlutterLogo(
              textColor: Colors.green,
              size: 90,
            ),
          ),
          animation: _animation,
        ),
      ],
    );
  }
}

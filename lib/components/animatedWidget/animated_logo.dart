import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  double size;
  AnimatedLogo({controllerPassedIn, this.size: 90})
      : super(listenable: controllerPassedIn);

  Animation<double> get controllerPassedIn => listenable;
//  Animation<double> = scaleAnimation;

  @override
  Widget build(BuildContext context) {
    Animation<double> scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(new CurvedAnimation(
      parent: controllerPassedIn,
      curve: Curves.elasticOut,
    ));
    return ScaleTransition(
      scale: scaleAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 60),
        child: Align(
          alignment: Alignment.topCenter,
          child: FlutterLogo(
            textColor: Colors.green,
            size: size,
          ),
        ),
      ),
    );
  }
}

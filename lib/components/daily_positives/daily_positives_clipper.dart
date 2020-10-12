import 'package:flutter/material.dart';

//class DailyPositivesPainter extends CustomPainter {
//  @override
//  void paint(Canvas canvas, Size size) {
//    var paint = Paint()
////    ..color = Colors.blue
//
////    paint.color = Colors.green[800];
//    ..style = PaintingStyle.fill;
//var path = Path();
//
//path.moveTo(0, 0);
//path.lineTo(0,size.height*.6);
//
////path.addArc(shapeBounds, 270, 180);
//
//
//path.quadraticBezierTo(
//    size.width*.5, size.height*.8, size.width, size.height*.5);
////path.arcTo(Rect.fromLTRB(0, 0, size.width, size.height) , 180, 150, false);
//path.lineTo(size.width,0);
//path.close();
//    canvas.drawPath(path, paint);
//
////
////    path.moveTo(0, 0);
////    path.lineTo(0, size.height*.7);
////    path.lineTo(size.width*.3 ,size.height*.7  );
////    path.lineTo(size.width*.3 ,size.height);
////    path.lineTo(size.width*.7 ,size.height);
////    path.lineTo(size.width*.7 ,size.height*.7);
////    path.lineTo(size.width ,size.height*.7);
////    path.lineTo(size.width ,0);
////    path.lineTo(size.width*.5 ,0 );
////    path.close();
//////
//
//
////
////
//
////    canvas.drawDRRect(RRect.fromLTRBR(70, 20, 10, 10, Radius.circular(10)), RRect.fromLTRBR(10, 10, 40, 40,Radius.circular(20)), Paint());
//
////    path.moveTo(150, 150);
////
////
////    path.quadraticBezierTo(
////        size.width / 2, size.height / 2, size.width, size.height * 0.25);
////    path.lineTo(size.width, 0);
////    path.lineTo(0, 0);
//
//
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//    throw UnimplementedError();
//  }
//}
class DailyPositivesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * .6);
    path.quadraticBezierTo(
        size.width * .5, size.height * .7, size.width, size.height * .52);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

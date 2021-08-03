import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(size.width/2, size.height / 2 - 10);
    Offset endingPoint = Offset(size.width/2, size.height / 2 + 10);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter{
  double xCoordinate = 0;
  double yCoordinate = 0;
  double circleSize = 10;
  CirclePainter({double X=0, double Y=0}){
    xCoordinate = X;
    yCoordinate = Y;
  }
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 15;

    Offset center = Offset(xCoordinate, yCoordinate);

    canvas.drawCircle(center, circleSize, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorBrightness: Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key}) : super(key: key);

  @override
  SnakeWidget createState() => SnakeWidget();
}

class SnakeWidget extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: CustomPaint(
            painter: CirclePainter(offsetDeviation: -100, newCircleSize: 10),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter{
  int deviation=0;
  double circleSize=25.0;
  CirclePainter({int offsetDeviation=0, double newCircleSize=25.0}){
    deviation = offsetDeviation;
    circleSize = newCircleSize;
  }
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2 + deviation, size.height / 2 + deviation);

    canvas.drawCircle(center, circleSize, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

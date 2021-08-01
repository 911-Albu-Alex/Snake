import 'package:flutter/material.dart';
import 'package:snake/service/service.dart';

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
  var service, circleX, circleY;
  SnakeWidget(){
    service = new Service();
    circleX = service.generateSpawnPoint()[0];
    circleY = service.generateSpawnPoint()[1];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: CustomPaint(
            painter: CirclePainter(X: circleX, Y: circleY),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter{
  double xCoordinate = 0;
  double yCoordinate = 0;
  double circleSize = 100;
  CirclePainter({double X=0, double Y=0}){
    xCoordinate = X;
    yCoordinate = Y;
  }
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset center = Offset(xCoordinate, yCoordinate);

    canvas.drawCircle(center, circleSize, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

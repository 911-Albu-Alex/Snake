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
      theme: ThemeData.dark(),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.yellowAccent,
        ),
        CustomPaint(
          painter: CirclePainter(X: circleX, Y:circleY),
        ),
        CustomPaint(
          painter: LinePainter(),
        ),
      ],
    );
  }
}

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

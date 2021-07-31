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
  double circleX = 0;
  double circleY = 0;
  @override
  Widget build(BuildContext context) {
    Service service = new Service(context);
    circleX = service.generateSpawnPoint()[0];
    circleY = service.generateSpawnPoint()[1];
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
  var _repaint;
  CirclePainter({repaint,double X=0, double Y=0}): super(repaint: repaint){
    xCoordinate = X;
    yCoordinate = Y;
    _repaint = repaint;
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
    return true;
  }
}

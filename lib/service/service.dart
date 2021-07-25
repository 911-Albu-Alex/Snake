import 'dart:math';
import 'package:flutter/cupertino.dart';

class Service{
  var screenHeight;
  var screenWidth;
  double get getScreenHeight{
    return screenHeight;
  }
  double get getScreenWidth{
    return screenWidth;
  }
  Service(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
  List<double> generateSpawnPoint(){
    var randomGenerator = new Random();
    int heightOffset = randomGenerator.nextInt(100) + 1;
    int widthOffset = randomGenerator.nextInt(200) + 1;
    final snakeHeight = screenHeight / 2 + heightOffset;
    final snakeWidth = screenWidth / 2 + widthOffset;
    List<double> coordinates = new List.empty(growable: true);
    coordinates.add(snakeHeight);
    coordinates.add(snakeWidth);
    return coordinates;
  }
}
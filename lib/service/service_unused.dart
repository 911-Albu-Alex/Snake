//unused
import 'dart:math';

class Service{
  Service(){}
  List<double> generateSpawnPoint(){
    var randomGenerator = new Random();
    int heightOffset = randomGenerator.nextInt(100) + 1;
    int widthOffset = randomGenerator.nextInt(200) + 1;
    final snakeHeight = 0.0 + heightOffset;
    final snakeWidth = 0.0 + widthOffset;
    List<double> coordinates = new List.empty(growable: true);
    coordinates.add(snakeHeight);
    coordinates.add(snakeWidth);
    return coordinates;
  }
}
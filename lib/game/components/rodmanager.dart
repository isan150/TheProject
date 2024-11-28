import 'dart:math';
import 'package:flame/components.dart';
import 'rod.dart';
import '../constants.dart';
import '../game.dart';

class Rodmanager extends Component with HasGameRef<Moonrun>{


double rodSpawn = 0;

@override
void update(double dt){
  rodSpawn += dt;
  const double rodSpeed = 2; 

 if (rodSpawn > rodSpeed)
 {
  rodSpawn = 0; 
  spawnRod(); 
 }
}


void spawnRod() {
  final double screenHeight = gameRef.size.y;
  const double rodSpace = 150; 
  const double minrodHeight = 50;
  const double rodWidth = 60; 


final double maxrodHeight = screenHeight - floorHeight  - rodSpace - minrodHeight;

final double bottomrodHeight = minrodHeight + Random().nextDouble() * (maxrodHeight - minrodHeight);

final double toprodHeight = screenHeight - floorHeight - bottomrodHeight - rodSpace;

final roddown = Rod(Vector2(gameRef.size.x, screenHeight - floorHeight - bottomrodHeight), 
Vector2(rodWidth, bottomrodHeight), isrodUP: false,
);

final rodup = Rod(Vector2(gameRef.size.x, 0), 
Vector2(rodWidth, toprodHeight), isrodUP: true,
);

gameRef.add(roddown);
gameRef.add(rodup);

}
}
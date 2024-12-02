import 'dart:math';
import 'package:flame/components.dart';
import '../game/constants.dart';
import '../game/game.dart';
import 'rod.dart';

class Rodmanager extends Component with HasGameRef<Moonrun> {
  double rodSpawn = 0;

  @override
  void update(double dt) {
    rodSpawn += dt;

    if (rodSpawn > rodSpeed) {
      rodSpawn = 0;
      spawnRod();
    }
  }

  void spawnRod() {
    final double screenHeight = gameRef.size.y;

    final double maxRodHeight = screenHeight - floorHeight - rodSpace - minrodHeight;
    final double bottomRodHeight = minrodHeight + Random().nextDouble() * (maxRodHeight - minrodHeight);
    final double topRodHeight = screenHeight - floorHeight - bottomRodHeight - rodSpace;

    final roddown = Rod(
      Vector2(gameRef.size.x, screenHeight - floorHeight - bottomRodHeight),
      Vector2(rodWidth, bottomRodHeight),
      isrodUP: false,
    );

    final rodup = Rod(
      Vector2(gameRef.size.x, 0),
      Vector2(rodWidth, topRodHeight),
      isrodUP: true,
    );

    gameRef.add(roddown);
    gameRef.add(rodup);
  }
}

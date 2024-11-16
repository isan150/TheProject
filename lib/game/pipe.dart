import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Pipe extends PositionComponent with CollisionCallbacks {
  late SpriteComponent upperPipe;
  late SpriteComponent lowerPipe;

  Pipe({required Vector2 position, required Sprite pipeSprite}) {
    size = Vector2(80, 600);
    this.position = position;

   
    upperPipe = SpriteComponent()
      ..sprite = pipeSprite
      ..size = Vector2(80, 300)
      ..position = Vector2(0, -300); 

    lowerPipe = SpriteComponent()
      ..sprite = pipeSprite
      ..size = Vector2(80, 300)
      ..position = Vector2(0, 300);

   
    add(upperPipe);
    add(lowerPipe);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt; 
    if (position.x < -size.x) {
      removeFromParent(); 
    }
  }
}

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Pipe extends PositionComponent with CollisionCallbacks {
  late SpriteComponent upperPipe;
  late SpriteComponent lowerPipe;

  // Score
  bool scored = false;

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

  bool get isTopPipe => null;

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt;

    // check if the bird has passed this pipe
    if (!scored && position.x + size.x <gameRef.bird.position.x) {
      scored = true;

      // only increase the score by passing the top pipe
      if (isTopPipe) {
        gameRef.incrementScore();
      }
    }
    if (position.x < -size.x) {
      removeFromParent(); 
    }
  }
}

mixin gameRef {
  var bird;

  static void incrementScore() {}
}

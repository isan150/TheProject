import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hellrun/constants.dart';
import 'package:hellrun/game.dart';

class Rod extends SpriteComponent with CollisionCallbacks, HasGameRef<Moonrun> {

final bool isrodUP;

bool scores = false;

Rod(Vector2 position, Vector2 size, {required this.isrodUP})
:super(position: position, size: size);



@override
FutureOr<void> onLoad() async{
  sprite = await Sprite.load(isrodUP ? 'roddown.png' : 'rodup.png');

  add(RectangleHitbox()); 

}
@override
  void update(double dt) {
  position.x -= floorSpeed * dt;

  if (!scores && position.x + size.x < gameRef.astronaut .position.x){
    scores = true;
  }
  if (position.x + size.x <= 0)
  {
    removeFromParent();
  }
  }
}
import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'constants.dart';

import 'game.dart';

class Floor extends SpriteComponent with HasGameRef<Moonrun>, CollisionCallbacks {

Floor() : super();

@override
  FutureOr<void> onLoad() async {
  size = Vector2(2 * gameRef.size.x, floorHeight);
  position = Vector2(0,gameRef.size.y - floorHeight);


  sprite = await Sprite.load('floor.png');


  add(RectangleHitbox());
}

@override
  void update(double dt) { 
    position.x -= floorSpeed * dt;
  
if (position.x + size.x / 2 <= 0)
{
  position.x = 0;
}
}}
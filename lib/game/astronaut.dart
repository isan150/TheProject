import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'constants.dart';
import 'game.dart';

import 'floor.dart';
import 'rod.dart';

class Astronaut extends SpriteComponent with CollisionCallbacks{

 Astronaut()  : super(position: Vector2(astroStartX, astroStartY), size: Vector2(astroWidth, astroHeight));

  double velocity = 0;
  final double gravity = 100;
  final double jumplvl = -300; 


  @override
  FutureOr<void> onLoad() async{
    sprite = await Sprite.load('astro.png');


    add(RectangleHitbox());
  }


void leap()
{
    velocity = jumplvl;
}

@override
void update(dt)
{
    velocity += gravity * dt;

    position.y += velocity *dt;
}

@override
void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Floor) 
    {
       (parent as Moonrun).gameOver();
    }
    
    if (other is Rod) 
    {
       (parent as Moonrun).gameOver();
    }





  }



}
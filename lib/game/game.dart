import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'astronaut.dart';
import 'background.dart';
import 'rod.dart';
import 'rodmanager.dart';
import 'score.dart';
import 'constants.dart';
import 'floor.dart';


class Moonrun extends FlameGame with TapDetector, HasCollisionDetection{

  late Astronaut astronaut;
  late Background background; 
  late Floor floor; 
  late Rodmanager rodmanager;
  late Scoretext scoretext; 

@override
  FutureOr<void> onLoad() {
  
  
background = Background(size);
add(background);

floor = Floor();
add(floor);

rodmanager = Rodmanager(); 
add(rodmanager);

astronaut = Astronaut();
add(astronaut);

scoretext = Scoretext();
add(scoretext);
}



  @override
  void onTap() {
    astronaut.leap();
  }

int score = 0; 
void updateScore() {
score += 1;
}


bool isGG = false;

void gameOver() {
  if (isGG) return;

  isGG = true;
  pauseEngine();

showDialog(context: buildContext!, 
builder: (context) => AlertDialog(
  title: const Text("GG"),
  content: Text("HIGH SCORE: $score"),
  actions: [
    TextButton(onPressed: (){
      Navigator.pop(context);
      resetGame();
    }, child: const Text("restart"),)
  ],),);


}

void resetGame() {
  astronaut.position = Vector2(astroStartX, astroStartY);
  astronaut.velocity = 0;
  score = 0;
  isGG = false;
  children.removeWhere((child) => child is Rod);
  //children.whereType<Rod>().forEach(action: (Rod rod) => rod.removeFromParent());
  resumeEngine();
  
}


}
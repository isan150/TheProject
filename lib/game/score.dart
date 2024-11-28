import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'game.dart';

class Scoretext extends TextComponent with HasGameRef<Moonrun>{

  Scoretext() : super(text: '0',
  textRenderer: TextPaint(
    style: const TextStyle(
    color: Colors.purple,
    fontSize: 48,
  ),),);

@override
FutureOr<void> onLoad(){
  position = Vector2((gameRef.size.x - size.x)/2, gameRef.size.y - size.y - 50,);
}

@override
void update(double dt){
  final ntext = gameRef.score.toString();
  if (text != ntext){
    text = ntext;
  }
}


}


import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'game.dart';

class Scoretext extends TextComponent with HasGameRef<Moonrun>{

Scoretext() : super(
  text: '0',
  textRenderer: TextPaint(
  style: const TextStyle(
  color: Color.fromARGB(255, 243, 115, 158),
  fontSize: 48,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
    ),
  ),
);


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


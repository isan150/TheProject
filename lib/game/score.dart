import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'floppy_bird_game.dart';

class ScoreText extends TextComponent with HasGameRef<FloppyBirdGame>{
  // init
  ScoreText() : super(
      text: '0',
      textRenderer: TextPaint(
        style: TextStyle( color: Colors.white, fontSize: 50),
      ),
  );

  //load
  @override
  FutureOr<void> onLoad() {
    //Setting position to lower middle
    position = Vector2((gameRef.size.x - size.x) / 2, gameRef.size.y - size.y - 50,);
  }

  // Update
  @override
  void update (double dt){
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }

}
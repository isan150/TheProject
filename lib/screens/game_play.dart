import 'package:flutter/material.dart';
import 'package:flame/game.dart';

// This file should handle the actual gameplay screen, where users can play the game.

FloppyBirdGame _floppybirdGame = FloppyBirdGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GameWidget(
      game: _floppybirdGame,
    );
  }
}
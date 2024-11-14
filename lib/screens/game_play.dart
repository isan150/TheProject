import 'package:flutter/material.dart';

FloppyBirdGame _floppybirdGame = FloppyBirdGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GameWidget(
      game: _floppybirdGame,
    )
  }
}
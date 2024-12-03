import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_clone/components/astronaut.dart';
import 'package:flutter/material.dart';
import '../components/background.dart';
import '../components/floor.dart';
import '../components/rod.dart';
import '../components/rodmanager.dart';
import 'score.dart';
import 'constants.dart';



enum DifficultyLevel { easy, medium, hard }

class Moonrun extends FlameGame with TapDetector, HasCollisionDetection {
  late Astronaut astronaut;
  late Background background;
  late Floor floor;
  late Rodmanager rodmanager;
  late Scoretext scoretext;

  DifficultyLevel difficultyLevel = DifficultyLevel.medium;

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

    showDialog(
      context: buildContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          "GOOD TRY JUMPER!!!",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 80, 3, 76),
            fontFamily: 'Lobster',
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Color.fromARGB(255, 243, 115, 158),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        content: Text("HIGH SCORE: $score"),
        backgroundColor: const Color.fromARGB(255, 243, 115, 158),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              resetGame();
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 80, 3, 76),
            ),
            child: const Text("GO AGAIN"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, '/'); // Navigate to main menu
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 80, 3, 76),
            ),
            child: const Text("MAIN MENU"),
          ),
        ],
      ),
    );
  }


  void resetGame() {
    astronaut.position = Vector2(astroStartX, astroStartY);
    astronaut.velocity = 0;
    score = 0;
    isGG = false;
    children.whereType<Rod>().forEach((Rod rod) => rod.removeFromParent());
    resumeEngine();
  }

  void setDifficulty(DifficultyLevel level) {
    difficultyLevel = level;
    switch (level) {
      case DifficultyLevel.easy:
      // Add easy mode settings (e.g., slower speed)
        break;
      case DifficultyLevel.medium:
      // Add medium mode settings
        break;
      case DifficultyLevel.hard:
      // Add hard mode settings (e.g., faster speed)
        break;
    }
  }
}

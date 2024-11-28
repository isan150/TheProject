import 'package:flappy_bird_clone/game/score.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'dart:math';
import 'pipe.dart';


class FloppyBirdGame extends FlameGame with HasCollisionDetection, TapDetector {
  late SpriteComponent bird;
  late double birdVelocity;
  late bool isGameOver;
  late Sprite pipeSprite;
  late ScoreText scoreText;

  double timeSinceLastPipe = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    pipeSprite = await loadSprite('pipe1.png');
    bird = SpriteComponent()
      ..sprite = await loadSprite('bird_normal.png') 
      ..size = Vector2(50, 50)
      ..position = Vector2(size.x / 4, size.y / 2);

    birdVelocity = 0;
    isGameOver = false;

    add(bird);

    // load scores
    scoreText = ScoreText();
    add(scoreText);
  }




  // Score

  int score = 0;
  void incrementScore(){
    score += 1;
  }
   
  @override
  void update(double dt) {
    super.update(dt);

    if (!isGameOver) {
      birdVelocity += 400 * dt; // Gravity
      bird.position.y += birdVelocity * dt;

      timeSinceLastPipe += dt;

      if (timeSinceLastPipe > 1.5) {
        spawnPipe();
        timeSinceLastPipe = 0; // Reset timer after spawning a pipe
      }

  
      if (bird.position.y > size.y - bird.size.y || bird.position.y < 0) {
        isGameOver = true;
      }
    }
  }

  void spawnPipe() {
    const gapSize = 150.0;
    final randomY = Random().nextDouble() * (size.y - gapSize - 200) + 100;

   
    add(Pipe(position: Vector2(size.x, randomY - gapSize / 2), pipeSprite: pipeSprite));
  }

  @override
  void onTapDown(TapDownInfo info) {
    if (!isGameOver) {
      birdVelocity = -300; // Bird jump
    } else {
      resetGame();
    }
  }

  void resetGame() {
    bird.position = Vector2(size.x / 4, size.y / 2);
    birdVelocity = 0;
    isGameOver = false;
    timeSinceLastPipe = 0; 
  }
}



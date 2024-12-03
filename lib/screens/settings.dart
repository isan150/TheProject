import 'package:flutter/material.dart';
import '../game/game.dart';

class Settings extends StatelessWidget {
  final Moonrun game;

  const Settings({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    DifficultyLevel selectedDifficulty = game.difficultyLevel;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 115, 158),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 3, 76),
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select Difficulty",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 80, 3, 76),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownButton<DifficultyLevel>(
              value: selectedDifficulty,
              dropdownColor: const Color.fromARGB(255, 243, 115, 158),
              items: DifficultyLevel.values.map((DifficultyLevel level) {
                return DropdownMenuItem<DifficultyLevel>(
                  value: level,
                  child: Text(
                    level.toString().split('.').last.toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 80, 3, 76),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newLevel) {
                if (newLevel != null) {
                  game.setDifficulty(newLevel);
                }
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 3, 76),
                foregroundColor: const Color.fromARGB(255, 243, 115, 158),
              ),
              child: const Text("BACK TO MENU"),
            ),
          ],
        ),
      ),
    );
  }
}

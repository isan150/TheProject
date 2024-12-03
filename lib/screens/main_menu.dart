import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/game.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatelessWidget {
  final Moonrun game;

  static const String id = 'mainMenu';

  const MainMenu({super.key, required this.game});

// Make sure the game isn't running when the main menu is up

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 115, 158),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'MOON JUMP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 75.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  color: Color.fromARGB(255, 80, 3, 76),
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Color.fromARGB(255, 243, 29, 197),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => GameWidget(game: game),
                    ),
                  );
                  game.resumeEngine();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 3, 76),
                  foregroundColor: const Color.fromARGB(255, 243, 115, 158),
                ),
                child: const Text('PLAY'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Image.asset('assets/images/htp.png'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('CLOSE'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 3, 76),
                  foregroundColor: const Color.fromARGB(255, 243, 115, 158),
                ),
                child: const Text(
                  'INSTRUCTIONS',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 3, 76),
                  foregroundColor: const Color.fromARGB(255, 243, 115, 158),
                ),
                child: const Text('SETTINGS'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () async {
                  final Uri githubUrl =
                  Uri.parse("https://github.com/isan150/TheProject");
                  if (await canLaunchUrl(githubUrl)) {
                    await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Could not open GitHub link."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 3, 76),
                  foregroundColor: const Color.fromARGB(255, 243, 115, 158),
                ),
                child: const Text("GITHUB"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// This should be the file that handles the main menu screen.

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text('Floppy Bird'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigates to the Gameplay Screen when this is pressed.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const GamePlay(),
                  ),
                );
              },
             child: Text('Play'),
             ),
            ElevatedButton(onPressed: () {}, 
            child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
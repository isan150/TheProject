import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The title of the game
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'Floppy Bird',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            ),

            // Play button
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  // The game should start when the Play button is pressed. (INSERT CODE HERE)
               
                },
                child: const Text('Play'),
              ),
            ),

            // How to Play button
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  // Display an image when the button is pressed.
               
                },
                child: const Text('How to Play'),
              ),
            ),

            // Settings button
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  
                  /* Wahid should implement the settings menu here

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsMenu(),
                    ),
                  );*/
                },
                child: const Text('Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


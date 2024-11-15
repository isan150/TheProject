import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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

            // Settings button
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsMenu(),
                    ),
                  );
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
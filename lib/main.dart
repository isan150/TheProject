import 'package:flutter/material.dart';
import 'package:flappy_bird_clone/screens/main_menu.dart';
import 'package:flappy_bird_clone/screens/settings.dart';
import 'package:flappy_bird_clone/game/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Moonrun game = Moonrun();

    return MaterialApp(
      title: 'Moon Jump',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(game: game), // Register "/" for the main menu
        '/settings': (context) => Settings(game: game), // Register settings
      },
    );
  }
}

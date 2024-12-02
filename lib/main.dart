import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game/game.dart';
import 'screens/main_menu.dart';
import 'screens/settings.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(game: Moonrun()),
        '/game': (context) => GameWidget(game: Moonrun()),
       // '/settings': (context) => const settings(), 
      },
    );
  }
}

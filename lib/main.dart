import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'screens/main_menu.dart';
// Define the Flame game class
class FloppyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Add game setup logic here
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floppy Bird',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Floppy Bird Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final FlameGame game;

  @override
  void initState() {
    super.initState();

    // Initialize the game
    game = FloppyBirdGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GameWidget(
        game: game, // Use the FlameGame instance here
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

// Define the Flame game class
void main() {
  runApp(const MyApp());
}

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
      debugShowCheckedModeBanner: false,
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
  const MyHomePage({super.key, required this.title});

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
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.green,
          ))
        ]));
  }
}

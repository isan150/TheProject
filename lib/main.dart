import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'screens/main_menu.dart';

/* ORIGINAL CODE
Future void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.util.fullscreen();
  runApp(MyApp());
}
*/

/* Trying some new stuff
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullscreen();
  runApp(MyApp());
}
*/

// Flame instance
void main() {
  final game = FlameGame();
  runApp(GameWidget(game: game));
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
      home: MainMenu(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BaseGame game;

  @override
  void initState() {
    super.initState();

    game = BaseGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),
        body: game.widget);
  }
}

@override Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(Widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        ]),)
    );
}
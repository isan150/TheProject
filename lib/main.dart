import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game/game.dart';
import 'screens/main_menu.dart';
import 'screens/settings.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  //runApp(const MyApp());
  
  final game = Moonrun();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenu.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenu(game: game),
      }
    )
  );
}

// Setup for notifications below
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationsScreen()
      );
  }
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationsScreen> {
  FlutterLocalNotificationsplugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }
}

 // Initialize notifications
  void _initializeNotifications() async {
    var androidInitialization = AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(
      android: androidInitialization,
    );
    
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Schedule daily notification
  void _scheduleDailyNotification() async {
    var time = Time(13, 30, 0); // Notifications at 1:30pm daily

    var androidDetails = AndroidNotificationDetails(
      'daily_notification_channel',
      'Daily Notifications',
      channelDescription: 'This channel is used for daily notifications.',
      importance: Importance.high,
      priority: Priority.high,
    );

    var notificationDetails = NotificationDetails(
      android: androidDetails
    );

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0, // notification id
      'Come and play Moon Jump!',
      'Try for a new high score today!',
      time, // the time to trigger the notification
      notificationDetails,
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification to Play')),
      body: Center(
        child: ElevatedButton(
          onPressed: _scheduleDailyNotification,
          child: Text('Schedule Daily Notification'),
        ),
      ),
    );
  }

*/

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(game: Moonrun(), overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenu(),
      }),
    );
  }
}
*/
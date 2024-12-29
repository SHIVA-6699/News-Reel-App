import 'package:flutter/material.dart';
import 'package:y_player/y_player.dart';
import 'package:youtub/youtube.dart';

void main() {
  YPlayerInitializer.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReelsSection(),
    );
  }
}

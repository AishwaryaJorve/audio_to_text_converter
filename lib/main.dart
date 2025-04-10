import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/recording_screen.dart';
import 'screens/transcription_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio to Text Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/record': (context) => const RecordingScreen(),
        '/transcription': (context) => const TranscriptionScreen(),
      },
    );
  }
}

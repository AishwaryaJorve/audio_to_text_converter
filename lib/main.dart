import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/recording_screen.dart';
import 'screens/transcription_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio to Text Converter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        // '/record': (context) => const RecordingScreen(),
        // '/transcription': (context) => const TranscriptionScreen(),
      },
    );
  }
}

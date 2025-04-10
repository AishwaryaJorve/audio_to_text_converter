import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/recording_screen.dart';
import 'screens/transcription_screen.dart';
import 'shared/theme/app_theme.dart';

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
      home: const HomeScreen(),
      routes: {
        '/transcription': (context) => const TranscriptionScreen(),
        '/record': (context) => const RecordingScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      },
    );
  }
}

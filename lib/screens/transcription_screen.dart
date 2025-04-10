import 'package:flutter/material.dart';

class TranscriptionScreen extends StatelessWidget {
  const TranscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'Your transcription text goes here',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
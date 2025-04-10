import 'package:flutter/material.dart';
import '../constants/icons/app_icons.dart';

class TranscriptionScreen extends StatelessWidget {
  const TranscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar with Back Button
            _buildCustomAppBar(context),

            // Transcription Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Your transcription text goes here',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          // Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the home screen
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          const Spacer(), // Pushes the back button to the left
        ],
      ),
    );
  }
}
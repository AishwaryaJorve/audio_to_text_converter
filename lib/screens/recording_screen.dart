import 'package:flutter/material.dart';
import '../constants/icons/app_icons.dart';
import '../services/transcription_service.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final TranscriptionService _transcriptionService = TranscriptionService();
  String _transcribedText = '';
  int _audioDuration = 0;
  bool _isRecording = false;

  Future<void> _saveTranscription() async {
    try {
      await _transcriptionService.saveTranscription(
        text: _transcribedText,
        audioPath: 'path/to/audio/file', // Replace with actual audio file path
        duration: _audioDuration,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transcription saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save transcription: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Transcription text display
              Expanded(
                child: TextField(
                  controller: TextEditingController(text: _transcribedText),
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Transcription will appear here...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _transcribedText = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Save and Record buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement audio recording
                    },
                    child: const Text('Start Recording'),
                  ),
                  ElevatedButton(
                    onPressed: _saveTranscription,
                    child: const Text('Save Transcription'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateTime.now().toString().split('.')[0],
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                _isRecording ? 'Recording in progress...' : 'Ready to record',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            'Summary Content',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildRecordingVisualization() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isRecording ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecordingControls() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRecording = !_isRecording;
          });
        },
        child: Icon(_isRecording ? AppIcons.stop : AppIcons.mic),
      ),
    );
  }
}
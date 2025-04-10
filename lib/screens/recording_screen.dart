import 'package:flutter/material.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // User Info and Timestamp
          _buildUserInfoSection(),

          // Summary Content
          _buildSummaryContent(),

          // Recording Visualization
          _buildRecordingVisualization(),

          // Recording Controls
          _buildRecordingControls(),
        ],
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
        child: Icon(_isRecording ? Icons.stop : Icons.mic),
      ),
    );
  }
}
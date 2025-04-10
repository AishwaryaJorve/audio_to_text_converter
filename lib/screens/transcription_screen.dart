import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// TODO: Add share_plus package to pubspec.yaml first:
// dependencies:
//   share_plus: ^latest_version
import 'package:share_plus/share_plus.dart';

class TranscriptionScreen extends StatelessWidget {
  const TranscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcription Result'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final text = 'Sample transcription text...';
              await Share.share(text);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(),
            const SizedBox(height: 24),
            _buildTranscriptionText(context),
            const SizedBox(height: 24),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Audio Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Duration', '2:30'),
            _buildInfoRow('File Size', '1.2 MB'),
            _buildInfoRow('Created', 'Today, 2:30 PM'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildTranscriptionText(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transcription',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(
                        text: 'Sample transcription text...',
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Transcription copied to clipboard'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Sample transcription text will appear here. The text will be scrollable if it exceeds the available space.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement edit functionality
            },
            icon: const Icon(Icons.edit),
            label: const Text('Edit'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement save functionality
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
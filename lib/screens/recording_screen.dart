import 'package:flutter/material.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool _isRecording = false;
  List<double> _waveformData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Audio'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                painter: WaveformPainter(_waveformData),
                size: Size(MediaQuery.of(context).size.width, 200),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _isRecording = !_isRecording;
                      // TODO: Implement actual recording logic
                    });
                  },
                  child: Icon(_isRecording ? Icons.stop : Icons.mic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final List<double> waveformData;

  WaveformPainter(this.waveformData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    if (waveformData.isEmpty) {
      // Draw a flat line if no data
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        paint,
      );
      return;
    }

    final path = Path();
    final pointSpacing = size.width / waveformData.length;

    path.moveTo(0, size.height / 2);

    for (var i = 0; i < waveformData.length; i++) {
      final x = i * pointSpacing;
      final y = size.height / 2 + (waveformData[i] * size.height / 2);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return oldDelegate.waveformData != waveformData;
  }
}
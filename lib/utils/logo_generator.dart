import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:convert';

class LogoGenerator {
  static Future<String> generateBase64Logo(Color color) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(const Offset(12, 12), 10, paint);
    
    final picture = recorder.endRecording();
    final image = await picture.toImage(24, 24);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    
    return base64Encode(Uint8List.view(byteData!.buffer));
  }
} 
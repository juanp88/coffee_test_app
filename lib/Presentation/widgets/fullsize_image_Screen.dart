import 'dart:io';
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Size Image'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

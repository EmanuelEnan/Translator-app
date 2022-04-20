import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  
  String? text;

  DisplayPage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation'),
      ),
      body: Column(
        children: [
          Text(text!),
        ],
      ),
    );
  }
}

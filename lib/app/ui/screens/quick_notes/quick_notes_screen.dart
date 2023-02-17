import 'package:flutter/material.dart';

class QuickNotesScreen extends StatelessWidget {
  const QuickNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Notes'),
      ),
      body: const Center(
        child: Text('QuickNotesScreen'),
      ),
    );
  }
}

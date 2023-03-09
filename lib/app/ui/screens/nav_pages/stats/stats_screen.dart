import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Stats'),
      ),
    );
  }
}

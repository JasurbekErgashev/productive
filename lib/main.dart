import 'package:flutter/material.dart';

void main() {
  runApp(const Productive());
}

class Productive extends StatelessWidget {
  const Productive({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Productive'),
        ),
        body: const Center(
          child: Text('Productive'),
        ),
      ),
    );
  }
}

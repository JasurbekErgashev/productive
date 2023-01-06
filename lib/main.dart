import 'package:flutter/material.dart';

void main() {
  runApp(const Productive());
}

class Productive extends StatelessWidget {
  const Productive({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      home: Scaffold(),
    );
  }
}

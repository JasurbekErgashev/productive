import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Signed In as', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            Text(user.email!, style: const TextStyle(color: Colors.blueGrey)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // Provider.of<AuthProvider>(context, listen: false).logout();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(Icons.arrow_back, size: 32),
              label: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

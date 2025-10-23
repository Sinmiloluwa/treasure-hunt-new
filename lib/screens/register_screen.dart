import 'package:flutter/material.dart';
import 'clue_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _register() {
    // Normally: send POST to Node.js backend
    // For demo: just go to clue screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClueScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Treasure Hunt"),
        backgroundColor: Colors.black,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your team name to start:"),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Player Name",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}

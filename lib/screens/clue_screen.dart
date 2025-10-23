import 'package:flutter/material.dart';
import 'leaderboard_screen.dart';

class ClueScreen extends StatefulWidget {
  const ClueScreen({super.key});

  @override
  State<ClueScreen> createState() => _ClueScreenState();
}

class _ClueScreenState extends State<ClueScreen> {
  final TextEditingController _answerController = TextEditingController();

  String clue = "I speak without a mouth and hear without ears. What am I?"; // mock clue
  String feedback = "";

  void _submitAnswer() {
    // Normally: call backend -> POST /api/clues/:id/solve
    if (_answerController.text.toLowerCase().trim() == "echo") {
      setState(() => feedback = "✅ Correct! Next clue unlocked.");
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
        );
      });
    } else {
      setState(() => feedback = "❌ Wrong answer, try again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clue")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(clue, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Answer",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            Text(feedback, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

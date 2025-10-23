import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock leaderboard
    final leaderboard = [
      {"name": "Team Alpha", "score": 3},
      {"name": "Team Bravo", "score": 2},
      {"name": "Team Charlie", "score": 1},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard")),
      body: ListView.builder(
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          final player = leaderboard[index];
          return ListTile(
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: const Text('Exact'),
            trailing: Text("Score: ${player["score"]}"),
          );
        },
      ),
    );
  }
}

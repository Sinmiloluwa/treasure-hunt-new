import 'package:flutter/material.dart';

class LeaderboardDetailsScreen extends StatelessWidget {
  const LeaderboardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard Details'),
      ),
      body: const Center(
        child: Text('Leaderboard Details Content Here'),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treasure_hunt/screens/hunt_details_screen.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events_outlined),
            onPressed: () {
              // Implement refresh functionality here
            },
          ),
        ],
        backgroundColor: const Color(0xFF0f1c22),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 30, top: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select a Hunt',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  final DateTime completedDate = DateTime(2025, 5, 15);

                  final String status =
                     DateFormat('MMM d, yyyy').format(completedDate);
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => HuntDetailsScreen(huntId: index + 1)
                      ))
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0), // Apply spacing here
                      child: leaderboardEntry(
                          'Hunt ${index + 1}', status, index + 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget leaderboardEntry(String name, String date, int rank) {
  return ListTile(
    leading: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: CachedNetworkImage(
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuBS15XDBk2yEBEwPuzZExAUXpPjnoNbWD7VIQcTU1vh1WLGgFEjHYO_WsM_vot94U_mpQue2jtkxtNEdyHpbwrInW74dDLO-J49xf7Mr54qU2YTWpbIK4jGJELMIw5KHcCSxh2Tr23fC0J8RIgQ-fULe5ToAwtb6aTJX30JUNxxS8FDYRuoBmbSOn6VIqwwa1EKo93hDR6eTPYHrlNUfMtZE06sgDSKk2GW4TeGqs9zmCoXD27V6e_ESIGAeO2NxUfKehM_VU4WuX8",
        height: 70,
        width: 70,
        fit: BoxFit.cover,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Completed: $date",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white54,
          ),
        ),
      ],
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.white54,
    ),
  );
}

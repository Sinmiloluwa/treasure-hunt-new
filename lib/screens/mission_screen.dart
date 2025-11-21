import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah's 32nd Birthday Hunt",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 5),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.flag, size: 16, color: Colors.white70),
                            SizedBox(width: 3),
                            Text('0/3', style: AppTextStyles.body),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: const [
                            Icon(Icons.people, size: 16, color: Colors.white70),
                            SizedBox(width: 3),
                            Text('10', style: AppTextStyles.body),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: const [
                            Icon(Icons.location_on, size: 16, color: Colors.white70),
                            SizedBox(width: 3),
                            Text('Melbourne, Australia', style: AppTextStyles.body),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // TabBar + TabBarView
          const SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white70,
                    tabs: [
                      Tab(text: 'Missions'),
                      Tab(text: 'Submissions'),
                      Tab(text: 'Leaderboard'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // ✅ Missions tab: scrollable list
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.white70,
                              ),
                              title: Text(
                                'Mission ${index + 1}: Description goes here',
                                style: AppTextStyles.body,
                              ),
                              subtitle: const Text(
                                'Status: Incomplete',
                                style: AppTextStyles.body,
                              ),
                            );
                          },
                        ),

                        // Submissions tab
                        const Center(
                          child: Text('Submissions Content', style: AppTextStyles.body),
                        ),

                        // Leaderboard tab
                        const Center(
                          child: Text('Leaderboard Content', style: AppTextStyles.body),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
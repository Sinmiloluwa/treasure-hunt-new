import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/screens/mission_screen.dart';

class TeamViewScreen extends StatelessWidget {
  const TeamViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> teamImages = [
      'https://images.unsplash.com/photo-1762532985216-6561bb733c56?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1762957044544-c5c70dd9ae77?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1749731630653-d9b3f00573ed?q=80&w=2232&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1661962394624-ebba47063dbe?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1763299020010-4949a5ea814e?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1762944084271-c64635a1f3b1?q=80&w=989&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team View'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Team',
                  style: AppTextStyles.heading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        '${teamImages.length} teams available',
                        style: AppTextStyles.body,
                      ),
                    ),
                    Row(
                      children: [
                        customIcon(Icons.add),
                        const SizedBox(
                          width: 8,
                        ),
                        customIcon(Icons.tune),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: teamImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75),
                  itemBuilder: (context, index) {
                    final imageUrl = teamImages[index];
                    return _buildCard(imageUrl, context);
                  },
                )
              ]),
        ),
      ),
    );
  }

  Widget customIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Color(0xFF933DFC),
        size: 26,
      ),
    );
  }

  Widget _buildCard(String imageUrl, BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Team Name',
              style: AppTextStyles.body,
            ),
          ),
          const SizedBox(height: 5),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.people,
              size: 16,
              color: Colors.white70,
            ),
            SizedBox(width: 4),
            Text(
              '5 Members',
              style: AppTextStyles.body,
            ),
          ]),
          const SizedBox(height: 5),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: Colors.white70,
            ),
            SizedBox(width: 4),
            Text(
              'Melbourne, Australia',
              style: AppTextStyles.body,
            ),
          ]),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: (){
              showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Terms & Conditions'),
                content: const Text(
                  'Please accept the terms and conditions to continue.'
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    child: const Text('Cancel', style: AppTextStyles.heading),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MissionScreen(imageUrl: imageUrl),
                        ),
                      );
                    },
                    child: Text('Accept', style: AppTextStyles.heading),
                  ),
                ],
              ),
            );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF933DFC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ), 
            child: Text('Join Team', style: AppTextStyles.heading.copyWith(fontSize: 16)),
            )
        ],
      ),
    );
  }
}

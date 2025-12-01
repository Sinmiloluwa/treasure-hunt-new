import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/screens/mission_screen.dart';

class HuntCardWidget extends StatelessWidget {
  const HuntCardWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
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

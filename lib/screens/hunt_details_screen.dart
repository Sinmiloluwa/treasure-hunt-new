import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/screens/team_view_screen.dart';
import 'package:treasure_hunt/widgets/bottom_sheet.dart';

class HuntDetailsScreen extends StatefulWidget {
  const HuntDetailsScreen({super.key, required this.huntId});

  final int huntId;

  @override
  State<HuntDetailsScreen> createState() => _HuntDetailsScreenState();
}

class _HuntDetailsScreenState extends State<HuntDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> imageItems = [
      'https://images.unsplash.com/photo-1668350965114-c366c30cfb13?auto=format&fit=crop&q=80&w=1035',
      'https://images.unsplash.com/photo-1518495973542-4542c06a5843?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?q=80&w=2174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Hunt Details'),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            // width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF933DFC),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 18),
              ),
              onPressed: () {
                BottomSheetWidget.show(
                  context,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Choose player mode',
                          style: AppTextStyles.heading.copyWith(fontSize: 24),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF933DFC),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigate to single player mode
                            },
                            child: const Text('Single', style: AppTextStyles.body,),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF933DFC),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TeamViewScreen(),
                                ),
                              );
                              // Navigate to multiplayer mode
                            },
                            child: const Text('Team', style: AppTextStyles.body,),
                          ),
                        ],
                      ),
                    ],
                  )
                );
              },
              child: Text('Play game'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CarouselSlider.builder(
                itemCount: imageItems.length,
                itemBuilder: (context, index, realIndex) {
                  final imageUrl = imageItems[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Amazing Treasure Hunt', style: AppTextStyles.heading),
              const SizedBox(height: 10),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.people,
                            size: 16,
                            color: Colors.white,
                            semanticLabel: 'People',
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "5,000",
                            style: AppTextStyles.cardSubtitle
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 16,
                            color: Colors.white,
                            semanticLabel: 'Time',
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "14:00 - 16:00",
                            style: AppTextStyles.cardSubtitle
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.white,
                            semanticLabel: 'Location',
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Bodija Ashi",
                            style: AppTextStyles.cardSubtitle
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              const Text('About'),
              const SizedBox(height: 10),
              const Text(
                  'Join us for an exhilarating treasure hunt adventure! Explore hidden gems, solve puzzles, and uncover secrets in a thrilling quest for treasure. Perfect for friends and family looking for fun and excitement.'),
              const SizedBox(height: 20),
              const Divider(),
              Container(
                height: 150,
                child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                  target: LatLng(7.3775, 3.9470),
                  zoom: 14,
                )),
              )
            ]),
          ),
        ));
  }
}

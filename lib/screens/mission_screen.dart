import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/screens/evidence_submission_screen.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  List<bool> completed = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
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
                            Icon(Icons.location_on,
                                size: 16, color: Colors.white70),
                            SizedBox(width: 3),
                            Text('Melbourne, Australia',
                                style: AppTextStyles.body),
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
                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    bool isDone = completed[index];

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EvidenceSubmissionScreen(
                                                  missionName: 'Mission ${index + 1}',
                                                  missionImage: widget.imageUrl,
                                                  description: 'This mission is for ${index + 1}',
                                            ),
                                          ),
                                        );
                                        // setState(() {
                                        //   completed[index] = !completed[index];
                                        // });
                                      },
                                      child: Opacity(
                                        opacity: isDone ? 0.4 : 1.0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 12.0),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 12,
                                            ),

                                            // LEADING (your two icons)
                                            leading: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isDone
                                                      ? Icons.check_circle
                                                      : Icons
                                                          .radio_button_unchecked,
                                                  color: isDone
                                                      ? Colors.grey
                                                      : const Color(0xFF933DFC),
                                                ),

                                              ],
                                            ),

                                            // TITLE (anything you want)
                                            title: Text(
                                              "This mission is for ${index + 1}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),

                                            // TRAILING (optional)
                                            trailing: Icon(
                                              Icons.chevron_right,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => showCustomPopup(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF933DFC),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                      ),
                                      child: const Text(
                                        "Finish",
                                        style: AppTextStyles.body,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Submissions tab
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(
                                    Icons.subdirectory_arrow_right,
                                    color: Color(0xFF933DFC)),
                                title: Text('Mission ${index + 1}',
                                    style: AppTextStyles.body),
                                subtitle: const Text('Submitted on: 2024-01-01',
                                    style: AppTextStyles.body),
                              );
                            },
                          ),
                        ),

                        // Leaderboard tab
                        const Center(
                          child: Text('Leaderboard Content',
                              style: AppTextStyles.body),
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

  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap X to close
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Well Done!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "You've successfully completed the hunt. Keep an eye on your profile for updates on rewards and upcoming hunts!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body,
                    ),
                    SvgPicture.asset(
                      'assets/icons/splash.svg',
                      width: 200, // optional
                      height: 200, // optional
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF933DFC),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Ok",
                        style: AppTextStyles.body,
                      ),
                    ),
                  ],
                ),
              ),

              /// X Button
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.close, size: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

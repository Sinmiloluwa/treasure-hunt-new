import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HuntDetailsScreen extends StatefulWidget {
  const HuntDetailsScreen({super.key, required this.huntId});

  final int huntId;

  @override
  State<HuntDetailsScreen> createState() => _HuntDetailsScreenState();
}

class _HuntDetailsScreenState extends State<HuntDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> players = [
      {'rank': '1st', 'name': 'You (Alex)', 'points': '1500'},
      {'rank': '2nd', 'name': 'Chloe', 'points': '1200'},
      {'rank': '3rd', 'name': 'James', 'points': '950'},
      {'rank': '4th', 'name': 'Mia', 'points': '870'},
      {'rank': '5th', 'name': 'Noah', 'points': '720'},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.emoji_events_outlined),
            ),
          ],
          title: const Text("Scavenger Hunts",
              style: TextStyle(
                  fontFamily: 'Jakarta', fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF0f1c22),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(76),
            child: Container(
              color: const Color(0xFF0f1c22),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(), // Remove default underline
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabs: [
                  _buildColoredTab("Individuals", 0),
                  _buildColoredTab("Groups", 1),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0f1c22),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search for a participant',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  itemCount: players.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final player = players[index];
                    final isTop = index == 0;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0f1c22),
                        borderRadius: BorderRadius.circular(20),
                        border: isTop
                            ? Border.all(
                                color: Colors.lightBlueAccent.withOpacity(0.8),
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          // Rank text
                          SizedBox(
                            width: 40,
                            child: Text(
                              player['rank'] as String,
                              style: TextStyle(
                                color: isTop ? Colors.white : Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          // Avatar
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: CachedNetworkImageProvider(
                              'https://i.pravatar.cc/150?img=${index + 1}',
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Name
                          Expanded(
                            child: Text(
                              player['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          // Points
                          Text(
                            '${player['points']} pts',
                            style: TextStyle(
                              color: isTop
                                  ? Colors.lightBlueAccent
                                  : Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColoredTab(String label, int index) {
    final bool isSelected = _tabController.index == index;
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        final bool selected = _tabController.index == index;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF17a3eb) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontFamily: 'Jakarta',
            ),
          ),
        );
      },
    );
  }
}

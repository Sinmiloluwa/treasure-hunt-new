import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:treasure_hunt/screens/detail_screen.dart';
import 'package:treasure_hunt/services/hunt_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<dynamic>> _huntsFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _huntsFuture = _fetchHunts();
  }

  Future<List<dynamic>> _fetchHunts() async {
  try { 
    final huntService = HuntService();
    final results = await Future.wait([
      huntService.getHunts('upcoming'),
      huntService.getHunts('ongoing'),
      huntService.getHunts('past'),
    ]);
    return results;
  } catch (e) { 
    print('Error in _fetchHunts: $e'); 
    rethrow; 
  }
}

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Scavenger Hunts",
              style: TextStyle(
                  fontFamily: 'Jakarta', fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF0f1c22),
          bottom: const TabBar(
            indicatorColor: Color(0xFF17a3eb),
            tabs: [
              Tab(
                child: Text(
                  "Upcoming",
                  style: TextStyle(
                    color: Colors.grey, // 👈 specific color for “Upcoming”
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jakarta',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Ongoing",
                  style: TextStyle(
                    color: Colors.grey, // 👈 specific color for “Ongoing”
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jakarta',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Past",
                  style: TextStyle(
                    color: Colors.grey, // 👈 specific color for “Past”
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jakarta',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
              future: _huntsFuture,
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const TabBarView(
                    children: [
                      HuntListShimmer(),
                      HuntListShimmer(),
                      HuntListShimmer(),
                    ],
                  );
                }

                if (snapshot.hasError) {
                  print("Error loading hunts: ${snapshot.error}");
                  // Show a simple error message
                  return const Center(
                    child: Text(
                      "Failed to load hunts. Please try again.",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                final upcomingHunts = snapshot.data![0];
                final ongoingHunts = snapshot.data![1];
                final pastHunts = snapshot.data![2];

                return TabBarView(
                  children: [
                    HuntList(
                        hunts: upcomingHunts, emptyText: "No upcoming hunts"),
                    HuntList(
                        hunts: ongoingHunts, emptyText: "No ongoing hunts"),
                    HuntList(hunts: pastHunts, emptyText: "No past hunts"),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class HuntList extends StatelessWidget {
  final List hunts;
  final String emptyText;

  const HuntList({super.key, required this.hunts, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    if (hunts.isEmpty) {
      return Center(
        child: Text(
          emptyText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hunts.length,
      itemBuilder: (context, index) {
        final hunt = hunts[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 21),
          child: Column(
            children: [
              HuntCard(hunt: hunt),
            ],
          ),
        );
      },
    );
  }
}

class HuntCard extends StatelessWidget {
  final Map hunt;

  const HuntCard({super.key, required this.hunt});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = hunt["image"] ??
        "https://lh3.googleusercontent.com/aida-public/AB6AXuBS15XDBk2yEBEwPuzZExAUXpPjnoNbWD7VIQcTU1vh1WLGgFEjHYO_WsM_vot94U_mpQue2jtkxtNEdyHpbwrInW74dDLO-J49xf7Mr54qU2YTWpbIK4jGJELMIw5KHcCSxh2Tr23fC0J8RIgQ-fULe5ToAwtb6aTJX30JUNxxS8FDYRuoBmbSOn6VIqwwa1EKo93hDR6eTPYHrlNUfMtZE06sgDSKk2GW4TeGqs9zmCoXD27V6e_ESIGAeO2NxUfKehM_VU4WuX8";
    final String title = hunt['title'] ?? 'Hunt Title';

    // Format start and end date
    String begins = '';
    String ends = '';
    try {
      begins =
          DateFormat('d MMM yyyy').format(DateTime.parse(hunt['startDate']));
      ends = DateFormat('d MMM yyyy').format(DateTime.parse(hunt['endDate']));
    } catch (_) {}

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(hunt: hunt),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🖼️ IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 170, // 👈 matches parent card height better
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 170,
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 170,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image,
                      size: 48, color: Colors.grey),
                ),
              ),
            ),

            // 📝 DETAILS
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1b2327),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3), // subtle shadow
                    blurRadius: 10, // softness
                    offset: const Offset(0, 4), // move shadow downward
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hunt['title'] ?? 'Hunt Title',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined,
                              size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "City Park",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '60% progress',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('Ends in 2 days',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  const SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.6,
                      color: const Color(0xFF17a3eb),
                      backgroundColor: Colors.grey[300],
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(hunt: hunt),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF17a3eb),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      child: const Text("View Details"),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HuntListShimmer extends StatelessWidget {
  const HuntListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 21),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[700]!,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
    );
  }
}

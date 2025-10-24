import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.hunt});
  final dynamic hunt;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: BottomAppBar(
            color: const Color(0xFF0f1c22),
            padding: EdgeInsets.zero, // remove default padding
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Created on ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(
                                  255, 67, 67, 67), // background color
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.share,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(
                                  255, 67, 67, 67), // background color
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.hunt['image'] ??
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBS15XDBk2yEBEwPuzZExAUXpPjnoNbWD7VIQcTU1vh1WLGgFEjHYO_WsM_vot94U_mpQue2jtkxtNEdyHpbwrInW74dDLO-J49xf7Mr54qU2YTWpbIK4jGJELMIw5KHcCSxh2Tr23fC0J8RIgQ-fULe5ToAwtb6aTJX30JUNxxS8FDYRuoBmbSOn6VIqwwa1EKo93hDR6eTPYHrlNUfMtZE06sgDSKk2GW4TeGqs9zmCoXD27V6e_ESIGAeO2NxUfKehM_VU4WuX8",
                    height: 200, // 👈 matches parent card height better
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Text(
                      widget.hunt['title'] ?? 'Treasure Hunt in Ibadan',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black54,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Uncover the city\'s hidden treasures!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                        indicatorColor: Color(0xFF17a3eb),
                        tabs: [
                          Tab(text: 'Description'),
                          Tab(text: 'Rules'),
                          Tab(text: 'Prizes'),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Join us in an exciting treasure hunt across Ibadan! Explore landmarks, solve clues, and discover hidden gems while competing for amazing prizes. Whether you\'re a local or a visitor, this adventure promises fun and excitement for everyone. Gather your team and get ready to embark on a journey filled with mystery and discovery!',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[300]),
                              ),
                            ),
                            // Prizes Tab
                            // Rules Tab
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '1. Teams must consist of 2-5 members.\n2. All clues must be solved in order.\n3. No use of GPS or map apps allowed.\n4. Respect public property and local regulations.\n5. The event is rain or shine; dress accordingly.\n6. Have fun and play fair!',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[300]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '1st Prize: ₦100,000\n2nd Prize: ₦50,000\n3rd Prize: ₦25,000\n\nAll participants will receive a certificate of participation and exclusive event merchandise.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[300]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 2),
              // Embed Map
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF17a3eb),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                    child: const Text("Form your crew"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                    child: const Text("Go Solo"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

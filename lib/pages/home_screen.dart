import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/screens/detail_screen.dart';
import 'package:treasure_hunt/screens/hunt_details_screen.dart';
import 'package:treasure_hunt/services/hunt_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1763661582974-ee6218176217?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1581248549073-4d4fd9bb8651?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1667558441287-9546dd046c1e?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1711906201917-e27af75be238?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Center(
                          child: const Text('Scavenger Hunts',
                              style: AppTextStyles.heading),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Popular Hunts',
                                style: AppTextStyles.subheading),
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled:
                                      true, // allows full height if needed
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) {
                                    return SafeArea(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize
                                              .min, // height adjusts to content
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Filter options go here',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 16),
                                            // Add your filter widgets here
                                            const Text('Option 1'),
                                            const SizedBox(height: 8),
                                            const Text('Option 2'),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: () {
                                                // Apply filters or any action
                                                Navigator.of(context)
                                                    .pop(); // close bottom sheet
                                              },
                                              child:
                                                  const Text('Apply Filters'),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF933DFC),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Filter',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.tune, size: 20),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.65),
                          itemBuilder: (context, index) {
                            final imageUrl = images[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CardWidget(imageUrl: imageUrl),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        const Text('Featured Hunts',
                            style: AppTextStyles.subheading),
                        const SizedBox(height: 40),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (context, index) {
                            final imageUrl =
                                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CardWidget(imageUrl: imageUrl),
                                ],
                              ),
                            );
                          },
                        ),
                      ]),
                ),
              ))),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HuntDetailsScreen(huntId: 1)));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF1b2327),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 120,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image,
                            size: 48, color: Colors.grey),
                      ),
                    ),
                  ),
                  // Positioned title and location
                  const Positioned(
                    right: 12,
                    top: 12,
                    child: Icon(Icons.bookmark_border_outlined,
                        color: Colors.white),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// People
                                Row(
                                  children: const [
                                    Icon(Icons.people,
                                        size: 16, color: Colors.black),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        "5,000 people",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8),

                                Row(
                                  children: const [
                                    Icon(Icons.location_on,
                                        size: 16, color: Colors.black),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        "Bodija Ashi",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class HuntList extends StatelessWidget {
//   final List hunts;
//   final String emptyText;

//   const HuntList({super.key, required this.hunts, required this.emptyText});

//   @override
//   Widget build(BuildContext context) {
//     if (hunts.isEmpty) {
//       return Center(
//         child: Text(
//           emptyText,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: hunts.length,
//       itemBuilder: (context, index) {
//         final hunt = hunts[index];
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 21),
//           child: Column(
//             children: [
//               HuntCard(hunt: hunt),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class HuntCard extends StatelessWidget {
//   final Map hunt;

//   const HuntCard({super.key, required this.hunt});

//   @override
//   Widget build(BuildContext context) {
//     final String imageUrl = hunt["image"] ??
//         "https://lh3.googleusercontent.com/aida-public/AB6AXuBS15XDBk2yEBEwPuzZExAUXpPjnoNbWD7VIQcTU1vh1WLGgFEjHYO_WsM_vot94U_mpQue2jtkxtNEdyHpbwrInW74dDLO-J49xf7Mr54qU2YTWpbIK4jGJELMIw5KHcCSxh2Tr23fC0J8RIgQ-fULe5ToAwtb6aTJX30JUNxxS8FDYRuoBmbSOn6VIqwwa1EKo93hDR6eTPYHrlNUfMtZE06sgDSKk2GW4TeGqs9zmCoXD27V6e_ESIGAeO2NxUfKehM_VU4WuX8";
//     final String title = hunt['title'] ?? 'Hunt Title';

//     // Format start and end date
//     String begins = '';
//     String ends = '';
//     try {
//       begins =
//           DateFormat('d MMM yyyy').format(DateTime.parse(hunt['startDate']));
//       ends = DateFormat('d MMM yyyy').format(DateTime.parse(hunt['endDate']));
//     } catch (_) {}

//     return InkWell(
//       borderRadius: BorderRadius.circular(16),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(hunt: hunt),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             )
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // 🖼️ IMAGE
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: imageUrl,
//                 height: 170, // 👈 matches parent card height better
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Container(
//                   height: 170,
//                   color: Colors.grey[200],
//                   child: const Center(child: CircularProgressIndicator()),
//                 ),
//                 errorWidget: (context, url, error) => Container(
//                   height: 170,
//                   color: Colors.grey[300],
//                   child: const Icon(Icons.broken_image,
//                       size: 48, color: Colors.grey),
//                 ),
//               ),
//             ),

//             // 📝 DETAILS
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1b2327),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(12),
//                   bottomRight: Radius.circular(12),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.3), // subtle shadow
//                     blurRadius: 10, // softness
//                     offset: const Offset(0, 4), // move shadow downward
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         hunt['title'] ?? 'Hunt Title',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Row(
//                         children: const [
//                           Icon(Icons.location_on_outlined,
//                               size: 16, color: Colors.grey),
//                           SizedBox(width: 4),
//                           Text(
//                             "City Park",
//                             style: TextStyle(fontSize: 16, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '60% progress',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       Text('Ends in 2 days',
//                           style: TextStyle(color: Colors.grey))
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: LinearProgressIndicator(
//                       value: 0.6,
//                       color: const Color(0xFF17a3eb),
//                       backgroundColor: Colors.grey[300],
//                       minHeight: 6,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(hunt: hunt),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF17a3eb),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(23),
//                         ),
//                       ),
//                       child: const Text("View Details"),
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HuntListShimmer extends StatelessWidget {
//   const HuntListShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 21),
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey[800]!,
//             highlightColor: Colors.grey[700]!,
//             child: Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[800],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

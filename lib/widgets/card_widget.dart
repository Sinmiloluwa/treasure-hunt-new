import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:treasure_hunt/screens/hunt_details_screen.dart';

class CardWidget extends StatefulWidget {
  final String imageUrl;
  final int? huntId;
  final String? type;

  const CardWidget({super.key, required this.imageUrl, this.huntId, this.type});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool bookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HuntDetailsScreen(huntId: widget.huntId ?? 1, imageUrl: widget.imageUrl)),
          );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
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
                Positioned(
                    right: 12,
                    top: 12,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          bookmarked = !bookmarked;
                        });
                      },
                      child: Icon(
                        bookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: Colors.white,
                      ),
                    )),
              ]),
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                const SizedBox(height: 8),
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
                            ),
                          ]),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
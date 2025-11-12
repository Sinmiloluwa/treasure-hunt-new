import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hunt Details'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: 'https://images.unsplash.com/photo-1668350965114-c366c30cfb13?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1035',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ]
          ),
          ),
      )
    );
  }
}

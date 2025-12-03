import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/pages/map_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treasure_hunt/widgets/image_picker.dart';

class EvidenceSubmissionScreen extends StatefulWidget {
  EvidenceSubmissionScreen(
      {super.key,
      required this.missionName,
      required this.missionImage,
      required this.description});
  final String missionName;
  final String missionImage;
  final String description;

  @override
  State<EvidenceSubmissionScreen> createState() =>
      _EvidenceSubmissionScreenState();
}

class _EvidenceSubmissionScreenState extends State<EvidenceSubmissionScreen> {
  List<XFile> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Evidence for ${widget.missionName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.missionImage,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Instructions', style: AppTextStyles.subheading)),
            const SizedBox(height: 15),
            Text(
              widget.description,
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 20),
            const Text('Map', style: AppTextStyles.subheading),
            const SizedBox(height: 15),
            Stack(children: [
              Container(
                height: 150,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(8.0828, 3.8757),
                    zoom: 14,
                  ),
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  gestureRecognizers: Set(),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MapScreen(coordinates: LatLng(8.0828, 3.8757)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Divider(color: Colors.white24),
            const SizedBox(height: 20),
            MultipleImagePicker(
              images: selectedImages,
              onChanged: (imgs) {
                setState(() {
                  selectedImages = imgs;
                });
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // makes the button full width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submission logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF933DFC),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Submit Evidence',
                    style: AppTextStyles.subheading,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

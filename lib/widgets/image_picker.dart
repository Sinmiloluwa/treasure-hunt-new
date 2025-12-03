import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
  final List<XFile> images;
  final Function(List<XFile>) onChanged;

  const MultipleImagePicker({
    super.key,
    required this.images,
    required this.onChanged,
  });

  @override
  State<MultipleImagePicker> createState() =>
      _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final picker = ImagePicker();

  Future<void> pickImages() async {
  try {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (!mounted) return;

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        widget.onChanged([...widget.images, ...pickedFiles]);
      });
    }
  } catch (e) {
    print("Image picking failed: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: pickImages,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Icon(Icons.upload, color: Colors.white70),
                SizedBox(width: 10),
                Text("Upload Images",
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Preview row
        if (widget.images.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.images.map((img) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(File(img.path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Remove button
                    Positioned(
                      right: 4,
                      top: 4,
                      child: GestureDetector(
                        onTap: () {
                          widget.onChanged(
                            widget.images.where((i) => i != img).toList(),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

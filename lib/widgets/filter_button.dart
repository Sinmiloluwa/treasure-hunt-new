import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  final List<String> huntTypes = [
    "Upcoming",
    "Ongoing",
    "Past",
    "Cancelled",
    "Featured",
    "Popular",
    "Nearby",
  ];
  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (_) => HuntFilterSheet(huntTypes: huntTypes),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _openFilterSheet,
      icon: const Icon(Icons.tune, size: 20),
      label: const Text('Filter', style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF933DFC),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
    );
  }
}

class HuntFilterSheet extends StatefulWidget {
  final List<String> huntTypes;
  const HuntFilterSheet({super.key, required this.huntTypes});

  @override
  State<HuntFilterSheet> createState() => _HuntFilterSheetState();
}

class _HuntFilterSheetState extends State<HuntFilterSheet> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Hunt Types', style: AppTextStyles.subheading),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.huntTypes.length,
                          itemBuilder: (context, index) {
                            final isActive = selectedIndex == index;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedIndex = index),
                              child: Chip(
                                backgroundColor: isActive
                                    ? const Color(0xFF933DFC)
                                    : Colors.grey[400],
                                label: Text(
                                  widget.huntTypes[index],
                                  style: TextStyle(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('Member Range',
                          style: AppTextStyles.subheading),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Minimum',
                                    style: AppTextStyles.body),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 14),
                                        hintText: "1000",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Maximum',
                                    style: AppTextStyles.body),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 14),
                                        hintText: "5000",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Apply Filter(s)"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF933DFC),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/widgets/search_bar_widget.dart';

class SingleViewScreen extends StatelessWidget {
  const SingleViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Find hunts near you'),
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(),
                  SizedBox(height: 20),
                  Text(
                    'Here you can enjoy the treasure hunt on your own. Explore the clues, solve puzzles, and find the treasure at your own pace. Good luck and have fun!',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}

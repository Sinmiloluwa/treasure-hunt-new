import 'package:flutter/material.dart';

class SingleViewScreen extends StatelessWidget {
  const SingleViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Single Player Mode'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to Single Player Mode!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Here you can enjoy the treasure hunt on your own. Explore the clues, solve puzzles, and find the treasure at your own pace. Good luck and have fun!',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

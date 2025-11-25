import 'package:flutter/material.dart';

class RightDrawerDemo extends StatefulWidget {
  @override
  _RightDrawerDemoState createState() => _RightDrawerDemoState();
}

class _RightDrawerDemoState extends State<RightDrawerDemo> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Main content
          Center(
            child: ElevatedButton(
              onPressed: () => setState(() => _isDrawerOpen = true),
              child: Text("Open Drawer"),
            ),
          ),

        
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: _isDrawerOpen ? 0 : -250, 
            width: 250,
            child: Material(
              elevation: 16,
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => setState(() => _isDrawerOpen = false),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Filter options here"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

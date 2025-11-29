import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    return TextField(
      focusNode: _focusNode,
      // onTap: () => setState(() => isFocused = true),
      // onEditingComplete: () => setState(() => isFocused = false),
      controller: _controller,
      style: TextStyle(
        color: isFocused ? Colors.white : Colors.grey[300],
      ),
      cursorColor: Colors.white,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Lagos, Nigeria',
        labelStyle: TextStyle(
          color: isFocused ? Colors.black : Colors.grey,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 8), // adjust height here
          child: Icon(
            Icons.search,
            color: isFocused ? Colors.white : Colors.grey,
            size: 22,
          ),
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  _controller.clear();
                  setState(() {});
                },
                child: const Icon(Icons.close),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

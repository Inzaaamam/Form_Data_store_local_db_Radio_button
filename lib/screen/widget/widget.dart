import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  String title;
  TextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0, // Adjust font size as needed
            color: Colors.black, // Adjust text color as needed
          ),
        ),
        const Text(
          '*',
          style: TextStyle(
            fontSize: 16.0, // Match the font size with the label text
            color: Colors.red, // Red color for the asterisk
          ),
        ),
      ],
    );
  }
}

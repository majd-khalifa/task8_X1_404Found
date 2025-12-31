import 'package:flutter/material.dart';

class SynopsisSection extends StatelessWidget {
  const SynopsisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Synopsis",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Earth's future has been riddled by disasters, famines, and droughts. "
            "There is only one way to ensure mankind's survival: Interstellar travel...",
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}

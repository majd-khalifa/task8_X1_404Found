import 'package:flutter/material.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.img, required this.name});

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(radius: 32, backgroundImage: AssetImage(img)),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

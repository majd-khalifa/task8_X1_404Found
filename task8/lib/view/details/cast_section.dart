import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _castItem("assets/images/unnamed (9).png", "Matthew M."),
              _castItem("assets/images/unnamed (10).png", "Anne H."),
              _castItem("assets/images/unnamed (9).png", "Jessica C."),
              _castItem("assets/images/unnamed (10).png", "Mackenzie F."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _castItem(String img, String name) {
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

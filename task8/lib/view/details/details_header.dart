import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/view/details/widgets/circle_icon_button.dart';
import 'package:task8/core/constants/app_color.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        SizedBox(
          height: 0.5.sh,
          width: 1.sw,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/unnamed (7).png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        const Color(0xFF191022).withOpacity(0.6),
                        const Color(0xFF191022),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleIconButton(icon: Icons.arrow_back),
                    Row(
                      children: [
                        CircleIconButton(icon: Icons.share),
                        const SizedBox(width: 12),
                        CircleIconButton(icon: Icons.favorite),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // المحتوى فوق الخلفية
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              // البوستر
              Container(
                width: 176,
                height: 256,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight, width: 2),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/unnamed (8).png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Interstellar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sci-Fi • Adventure • Drama",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _chip("PG-13"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.calendar_month, "2014"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.schedule, "2h 49m"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.translate, "English"),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: _primaryButton()),
                  const SizedBox(width: 12),
                  _circleButton(Icons.bookmark_add),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------- REUSABLE WIDGETS ----------------

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white38),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

Widget _iconChip(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white70, size: 14),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}

Widget _primaryButton() {
  return Container(
    width: 1.sw,
    height: 48,
    decoration: BoxDecoration(
      color: Color(0xFF7F13EC),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
      child: Text(
        "Watch Trailer",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _circleButton(IconData icon) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(icon, color: Colors.white),
  );
}

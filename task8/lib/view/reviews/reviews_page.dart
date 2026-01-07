import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'widgets/reviews_header.dart';
import 'widgets/reviews_poster_card.dart';
import 'widgets/reviews_rating.dart';
import 'widgets/reviews_textbox.dart';
import 'widgets/reviews_submit.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double rating = 4.0;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // الخلفية العلوية
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: const _TopBackground(),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  ReviewsHeader(),
                  SizedBox(height: 16.h),
                  const ReviewsPosterCard(),
                  SizedBox(height: 20.h),
                  ReviewsRating(
                    rating: rating,
                    onRate: (v) => setState(() => rating = v),
                  ),
                  SizedBox(height: 18.h),
                  ReviewsTextBox(controller: controller),
                  SizedBox(height: 18.h),
                  ReviewsSubmit(controller: controller),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBackground extends StatelessWidget {
  const _TopBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCY6ooZ2L1Od87sNGLjXDt2G97JQy1lk_F2HZAjV1ESVxSBlPP8uet6x9DW9fW5YI0ceJrB7uDgyLCGjHklcAumj6utJKh7HaX19T036HbYDZnHjJshW91Q80qg3JyGg8gFA2aL9b1aipiSUovFj4plzvncSYljXtR_81hi4Rqtmvs_QGwuiV2jnu6Amw3-bPyQMFPGPJrQmpk40AeFCMczgT_oZMuxWfDJmK4AcAJ7pLgWsyK_cIGUi3P8cmB7YFdZVd7OML17GN3Y',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6),
                AppColors.backgroundDark.withOpacity(0.9),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

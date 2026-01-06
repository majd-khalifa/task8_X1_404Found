import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double rating = 4.0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // Top blurred background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              decoration: const BoxDecoration(),
              child: Stack(
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
                          Colors.black.withAlpha((0.6 * 255).round()),
                          AppColors.backgroundDark.withAlpha(
                            (0.9 * 255).round(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        label: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                      Text(
                        'Write Review',
                        style: AppTextStyles.textStyle24.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 56.w),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Poster card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha((0.04 * 255).round()),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: Colors.white.withAlpha((0.04 * 255).round()),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 64.w,
                          height: 96.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuDs3ZWMxFp1I936D4P_e5ocpLkEeRQ4hxk948t5bnrPohCkX2cdmU7PpDuWhySafsdLD1ZV7GPMB7BpJU33zmcCBU8JVy43KlWJrgUiRme4KnCOwHqAQEa_da26wX5mYqfb38lSG9P9xhpSxTCUI4QYvgAm0mq8u6nJDFxHhzwP8rdZZv-39LQaR1N2kRad25e4YBR9SqIoZDOF6Mq4-my4HSW7wKB6B2I9brb4CQ4NDS9hWuGJPLiMl0L8Sz0mbnFVkFRKvyQwYSo3',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Interstellar',
                                style: AppTextStyles.textStyle30.copyWith(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                '2014 • Sci-Fi • Drama',
                                style: AppTextStyles.textStyle12.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Rating header
                  Column(
                    children: [
                      Text(
                        'TAP TO RATE',
                        style: AppTextStyles.textStyle12.copyWith(
                          letterSpacing: 1.8,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _starRow(),
                      const SizedBox(height: 8),
                      Text(
                        rating.toStringAsFixed(1),
                        style: AppTextStyles.textStyle16.copyWith(
                          color: AppColors.primary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18.h),

                  // Text area
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 220.h,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha((0.03 * 255).round()),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.white.withAlpha(
                                (0.06 * 255).round(),
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                controller: _controller,
                                maxLines: null,
                                style: AppTextStyles.textStyle14.copyWith(
                                  color: Colors.white70,
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText:
                                      'Share your thoughts on the movie... What did you like? What did you dislike?',
                                  hintStyle: AppTextStyles.textStyle14.copyWith(
                                    color: Colors.white38,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 12.w,
                                bottom: 8.h,
                                child: Text(
                                  '${_controller.text.length} / 500',
                                  style: const TextStyle(color: Colors.white38),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 18.h),

                        // Submit + discard
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              // placeholder: submit action
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Review submitted (demo)'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              elevation: 12,
                              shadowColor: AppColors.primary.withAlpha(
                                (0.3 * 255).round(),
                              ),
                            ),
                            child: Text(
                              'Submit Review',
                              style: AppTextStyles.textStyle18.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Discard Changes',
                            style: AppTextStyles.textStyle14.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _starRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        final idx = i + 1;
        return GestureDetector(
          onTap: () => setState(() => rating = idx.toDouble()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              Icons.star,
              size: 36.sp,
              color: idx <= rating ? AppColors.primary : Colors.white24,
            ),
          ),
        );
      }),
    );
  }
}

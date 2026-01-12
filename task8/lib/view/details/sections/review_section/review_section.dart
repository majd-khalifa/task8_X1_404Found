// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/pref_key.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/models/review.dart';
import 'package:task8/view/details/widgets/review_card.dart';

class ReviewSection extends StatefulWidget {
  final int movieId;
  const ReviewSection({super.key, required this.movieId});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final ApiServices _api = ApiServices();
  bool isLoading = true;
  bool isExpanded = false;
  int userid = 3; //عدل هنا
  List<Review> reviews = [];
  Review? userReview;
  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    setState(() => isLoading = true);

    try {
      final response = await _api.getData(
        url: ApiLink.movieReviews(widget.movieId),
      );

      debugPrint("API RESPONSE: $response");

      if (response.isNotEmpty &&
          response[0] is Map &&
          response[0]['data'] != null) {
        final List rawData = List.from(response[0]['data']);

        // تحويل البيانات إلى Reviews
        final List<Review> allReviews = rawData
            .map((e) => Review.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        // استخراج تعليق المستخدم الحالي (إن وجد)
        Review? currentUserReview;
        try {
          currentUserReview = allReviews.firstWhere(
            (r) => r.user.email == PrefKey.useremail,
          );
        } catch (_) {
          currentUserReview = null;
        }

        // حذف تعليق المستخدم من القائمة العامة
        final List<Review> otherReviews = allReviews
            .where((r) => r.user.email != PrefKey.useremail)
            .toList();

        setState(() {
          userReview = currentUserReview;
          reviews = otherReviews;
          isLoading = false;
        });

        debugPrint("USER REVIEW FOUND: ${userReview != null}");
        debugPrint("OTHER REVIEWS COUNT: ${reviews.length}");
      } else {
        setState(() {
          reviews = [];
          userReview = null;
          isLoading = false;
        });
      }
    } catch (e, st) {
      setState(() => isLoading = false);
      debugPrint("ERROR FETCHING REVIEWS: $e\n$st");
      SnackBarHelper.showError(context, "Failed to load reviews");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Reviews (${reviews.length})",
                style: AppTextStyles.textStyle18,
              ),
              Spacer(),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.reviews);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rate_review,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Post Review",
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (userReview != null)
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 1.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "You",
                              style: AppTextStyles.textStyle14.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userReview!.user.name,
                                style: AppTextStyles.textStyle14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: List.generate(
                                  userReview!.rating,
                                  (index) => Icon(
                                    Icons.star,
                                    size: 14.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_horiz, color: AppColors.cardDark),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    userReview!.comment,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14.sp,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Divider(color: Colors.white.withOpacity(0.08), thickness: 1),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 👍 Likes
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.thumb_up_alt_sharp,
                              size: 18.sp,
                              color: AppColors.white.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "24", // لاحقاً من API
                            style: TextStyle(
                              color: AppColors.white.withOpacity(0.5),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      // ✏️ Edit & 🗑 Delete
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.reviews,
                                arguments: {
                                  'movieId': widget.movieId,
                                  'review': userReview,
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.borderLight,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 14.sp,
                                    color: AppColors.white,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "Edit",
                                    style: AppTextStyles.textStyle12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.rottenTomato.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 14.sp,
                                    color: Colors.red[400],
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "Delete",
                                    style: AppTextStyles.textStyle12.copyWith(
                                      color: Colors.red[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          SizedBox(height: 16.h),
          if (!isLoading && reviews.isNotEmpty)
            ...List.generate(
              isExpanded
                  ? reviews.length
                  : (reviews.length > 2 ? 2 : reviews.length),
              (index) {
                final review = reviews[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ReviewCard(
                    initials: review.user.name.substring(0, 2).toUpperCase(),
                    avatarBg: AppColors.green.withOpacity(0.2),
                    avatarTextColor: AppColors.greenprofilebackground,
                    name: review.user.name,
                    rating: review.rating,
                    dateText: "Recently",
                    reviewText: review.comment,
                  ),
                );
              },
            ),
          if (reviews.length > 2) // يظهر الزر فقط إذا عدد التعليقات أكبر من 2
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded; // تغيير الحالة عند الضغط
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    isExpanded ? "Show Less" : "View All Reviews",
                    style: AppTextStyles.textStyle14.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/home/widgets/category_chip.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedRatingIndex = 0;

  final List<String> ratings = ["All", "PG-13", "PG", "R"];

  int? yearFrom;
  int? yearTo;

  int? durationFrom;
  int? durationTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.backgroundLight),
        title: Text("Filters", style: AppTextStyles.textStyle20),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// AGE RATING
            Text("Age Rating", style: AppTextStyles.textStyle16),
            12.verticalSpace,

            SizedBox(
              height: 36.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ratings.length,
                separatorBuilder: (_, __) => 12.horizontalSpace,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedRatingIndex = index);
                    },
                    child: CategoryChip(
                      label: ratings[index],
                      isActive: selectedRatingIndex == index,
                    ),
                  );
                },
              ),
            ),

            24.verticalSpace,

            /// YEAR RANGE
            Text("Year Range", style: AppTextStyles.textStyle16),
            12.verticalSpace,

            Row(
              children: [
                Expanded(
                  child: _buildNumberField(
                    label: "From",
                    onChanged: (v) => yearFrom = int.tryParse(v),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: _buildNumberField(
                    label: "To",
                    onChanged: (v) => yearTo = int.tryParse(v),
                  ),
                ),
              ],
            ),

            24.verticalSpace,

            /// DURATION RANGE
            Text("Duration (min)", style: AppTextStyles.textStyle16),
            12.verticalSpace,

            Row(
              children: [
                Expanded(
                  child: _buildNumberField(
                    label: "From",
                    onChanged: (v) => durationFrom = int.tryParse(v),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: _buildNumberField(
                    label: "To",
                    onChanged: (v) => durationTo = int.tryParse(v),
                  ),
                ),
              ],
            ),

            40.verticalSpace,

            /// APPLY BUTTON
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    "rating": ratings[selectedRatingIndex] == "All"
                        ? null
                        : ratings[selectedRatingIndex],
                    "yearFrom": yearFrom,
                    "yearTo": yearTo,
                    "durationFrom": durationFrom,
                    "durationTo": durationTo,
                  });
                },
                child: Text("Apply Filter", style: AppTextStyles.textStyle16),
              ),
            ),

            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField({
    required String label,
    required Function(String) onChanged,
  }) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      style: AppTextStyles.textStyle14,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.textStyle14.copyWith(
          color: AppColors.textMuted,
        ),
        filled: true,
        fillColor: AppColors.cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
      ),
    );
  }
}

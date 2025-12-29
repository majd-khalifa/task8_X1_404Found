import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_chip.dart';
import 'widgets/trending_card.dart';
import 'widgets/movie_grid_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSearchBar(),
        16.verticalSpace,

        // Categories
        SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (_, index) {
              final categories = ["All", "Action", "Sci-Fi", "Comedy", "Drama"];
              return CategoryChip(
                label: categories[index],
                isActive: index == 0,
              );
            },
          ),
        ),

        20.verticalSpace,

        // Trending
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text("Trending Now", style: AppTextStyles.textStyle20),
        ),
        12.verticalSpace,
        SizedBox(
          height: 280.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: const [
              TrendingCard(
                image: "assets/images/dune.png",
                title: "Dune: Part Two",
                subtitle: "Sci-Fi, Adventure",
                rating: "8.8",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/oppenheimer.png",
                title: "Oppenheimer",
                subtitle: "Drama, History",
                rating: "9.1",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/barbie.png",
                title: "Barbie",
                subtitle: "Comedy, Fantasy",
                rating: "6.5",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/oppenheimer.png",
                title: "Oppenheimer",
                subtitle: "Drama, History",
                rating: "9.1",
              ),
            ],
          ),
        ),

        20.verticalSpace,

        // For You
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text("For You", style: AppTextStyles.textStyle20),
        ),
        12.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.55,
            children: const [
              MovieGridItem(
                image: "assets/images/dune.png",
                title: "Dune: Part Two",
                rating: "8.8",
                year: "2024",
                badge: "98% Match",
              ),
              MovieGridItem(
                image: "assets/images/civil_war.png",
                title: "Civil War",
                rating: "7.6",
                year: "2024",
              ),
              MovieGridItem(
                image: "assets/images/poor_thing.png",
                title: "Poor Things",
                rating: "8.4",
                year: "2023",
              ),
              MovieGridItem(
                image: "assets/images/the_creator.png",
                title: "The Creator",
                rating: "6.9",
                year: "2023",
                badge: "New",
              ),
              MovieGridItem(
                image: "assets/images/spider_man.png",
                title: "Spider-Man",
                rating: "9.0",
                year: "2023",
              ),
              MovieGridItem(
                image: "assets/images/salt_burn.png",
                title: "Saltburn",
                rating: "7.1",
                year: "2023",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
